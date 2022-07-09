from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import random
import smtplib
from typing import Optional
from fastapi import *
from jwt import *
import jwt
import pydantic
import pymongo
import hashlib
from bson import ObjectId



app = FastAPI()

database = pymongo.MongoClient("mongodb+srv://saifelbob2002:huhqow-mekdeg-Nizhu2@cluster0.40yph.mongodb.net/oyp?retryWrites=true&w=majority")


class User(pydantic.BaseModel):
    name: str
    email:str
    password:str
    mobileNum: str
    Orders: Optional[list]

class Vendor(pydantic.BaseModel):
    name: str
    email: str
    id: Optional[str]
    password: Optional[str]
    rate: Optional[float]

currentUser = {}

def isStrongPassword(password:str):
    isSpecialSymbolsIncluded = False
    for i in ["@", "!", "#", "$", "%", "^", "&", "*"]:
        if password.__contains__(i):
            isSpecialSymbolsIncluded = True

    if (password.__len__()>= 10) and (isSpecialSymbolsIncluded):
        return True

def verifyEmail(sendTo: str, token: str):
    otp = random.randrange(11111, 99999)

    message = MIMEMultipart()

    message.add_header("From", "Women Co.")
    message.add_header("To", "you")
    message.add_header("Subject", "Verify your account")
    message.attach(MIMEText(
    """<h1>Women Co.</h1>
    <br/>
    <h2>Verify your account</h2>
    your OTP is:
    <h3>{}</h3>
    """.format(otp), "html"))

    currentUser[token] = otp
    server = smtplib.SMTP_SSL("smtp.gmail.com", 465)
    server.ehlo()
    server.login("email", "password")
    server.sendmail("Women Co.", sendTo, message.as_string())
    print("Email sent")

def sendInfoToVendor(sendTo: str, name: str):
    randID = "WOC"+str(random.randrange(1111111, 9999999))
    randPassword = "Vendor"+str(randID[6::1])

    message = MIMEMultipart()

    message.add_header("From", "Women Co.")
    message.add_header("To", "you")
    message.add_header("Subject", "Your Women Co. account's information")
    message.attach(MIMEText(
    """<h1>Women Co.</h1>
    <br/>
    <h2>Welcome {} , Congratulations to be a vendor at Women Co.</h2>
    <br/>
    <h3>These are your account information</h3>
    <br/>
    <h3>ID : </h3> {}
    <br/>
    <h3>Password : </h3> {}    
    <br/>
    <br/>
    Use your ID and password to log in to your account in our mobile application
    """.format(name.title(), randID, randPassword), "html"))

    server = smtplib.SMTP_SSL("smtp.gmail.com", 465)
    server.ehlo()
    server.login("email", "password")
    server.sendmail("Women Co.", sendTo, message.as_string())
    print("Email sent")
    return {"id":randID, "password":randPassword}


@app.post("/")
def home(numbers: dict = Body(...)):

    return {"sum": numbers["1"]+numbers["2"]}

@app.post("/signUp")
def signUp(userData: User):
    if isStrongPassword(userData.password):
        userData.password = str(hashlib.pbkdf2_hmac("sha256", userData.password.encode(), bytes(10), 100000))
        
        userToken = jwt.encode(payload={"email":userData.email}, key="VerifyUser", algorithm="HS256")
        currentUser["userData"] = userData.__dict__
        verifyEmail(userData.email, userToken)
        print(currentUser)
        return {"Success":"please check your email for code", "Token":userToken}
    else:
        return "invalid Password"


@app.post("/verify/auth0/{token}")
def verifyUser(token, response: Response, otp:int=Body(...)):
    if currentUser[token] == otp:
        database["test"]["Users"].insert_one(currentUser['userData'])
        currentUser.clear()
        response.status_code = status.HTTP_200_OK
        return {"Success":"User verified Successfully"}
    else:
        response.status_code = status.HTTP_401_UNAUTHORIZED
        return {"Failure": "User verification failed try again later"}


@app.post("/logIn")
def logIn( user: dict = Body(...)):
    password = str(hashlib.pbkdf2_hmac("sha256", str(user["password"]).encode(), bytes(10), 100000))

    findUser = database["test"]["Users"].find_one({"email":user['email'], "password":password})

    if findUser:
        userToken = jwt.encode(payload={"userToken":str(findUser["_id"])}, key="UserToken", algorithm="HS256")
        return {"success":"Logged In", "token": userToken}
    else:
        return {"Fail":"User Can't found or wrong password"}

@app.put("/resetPassword/{token}")
def resetPassword(token, newPassword: str = Body(...)):
    if isStrongPassword(newPassword):
        newPassword = str(hashlib.pbkdf2_hmac("sha256", newPassword.encode(), bytes(10), 100000))
        print(newPassword)
        objectId = jwt.decode(str(token), "UserToken", ["HS256"])
        database['test']['Users'].find_one_and_update({"_id":ObjectId(objectId['userToken'])}, {"$set":{"password":newPassword}})

        return {"Success":"password reset successfully"}
    else:
        return {"Failure": "Password is not strong"}


@app.post("/createVendor")
def createVendor(response: Response ,vendor: Vendor):
    #!!!!!! IMPORTANT !!!!!!!!
    #this post request will be used only by admins 
    try:
        vendorInformation = sendInfoToVendor(vendor.email, vendor.name)
        vendor.id = vendorInformation['id']
        vendor.password = str(hashlib.pbkdf2_hmac("sha256", vendorInformation['password'].encode(), bytes(10), 100000))
        vendor.rate = 0
        database['test']['Vendors'].insert_one(vendor.__dict__)
        return {"Success":"Vendor createad Successfully"}
    except:
        response.status_code = status.HTTP_406_NOT_ACCEPTABLE
        return {"Fail": "Failed to create new vendor"}
