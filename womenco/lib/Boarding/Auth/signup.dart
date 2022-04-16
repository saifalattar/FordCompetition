import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/Boarding/Auth/verification.dart';
import 'package:womenco/Cubit/bloc.dart';
import 'package:womenco/Cubit/states.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
          builder: (context, states) {
            return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                  )),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 25.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create\nAccount",
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 60.h),
                      TextField(
                        decoration: InputDecoration(labelText: "Name"),
                      ),
                      SizedBox(height: 30.h),
                      TextField(
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                      SizedBox(height: 30.h),
                      TextField(
                        decoration: InputDecoration(labelText: "Phone Number"),
                      ),
                      SizedBox(height: 30.h),
                      TextField(
                        obscureText:
                            WomenCoCubit.GET(context).isPasswordSecured,
                        decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: WomenCoCubit.GET(context).isPasswordSecured
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  WomenCoCubit.GET(context).isPasswordSecured =
                                      !WomenCoCubit.GET(context)
                                          .isPasswordSecured;
                                });
                              },
                            )),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Checkbox(
                              value: isAgree,
                              onChanged: (bool? isAgreed) {
                                setState(() {
                                  isAgree = isAgreed;
                                });
                              }),
                          Text(
                              "I agree to the Terms & Conditions  \nand Privacy and Policy")
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Container(
                          width: 364.w,
                          height: 46.h,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationPage()));
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                  enableFeedback: true,
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.pink[200]))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, states) {}),
    );
  }
}

bool? isAgree = false;
