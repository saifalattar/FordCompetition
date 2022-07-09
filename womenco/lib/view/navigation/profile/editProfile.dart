import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';
import 'package:womenco/shared/component/components.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));
    return BlocConsumer<WomenCoCubit, WomenCoStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ))),
          body: Container(
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Edit My Profile",
                    style: TextStyle(
                        fontFamily: "Avenir",
                        color: Colors.black,
                        fontSize: 20),
                  )),
                  SizedBox(
                    height: 35.h,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundImage: NetworkImage(
                          //to add the user picture type
                          //WomenCoCubit.GET(context).user.profileImageURL
                          "https://www.blexar.com/avatar.png",
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          iconSize: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  TextField(
                    controller: userName_edit,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        hintText: WomenCoCubit.GET(context).user.Name),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextField(
                    controller: Email_edit,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "E-Mail",
                        hintText: WomenCoCubit.GET(context).user.Email),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextField(
                    controller: phone_edit,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: WomenCoCubit.GET(context).user.Phone),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextField(
                    controller: password_edit,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: WomenCoCubit.GET(context).isPasswordSecured,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: WomenCoCubit.GET(context).isPasswordSecured
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              WomenCoCubit.GET(context).isPasswordSecured =
                                  !WomenCoCubit.GET(context).isPasswordSecured;
                            });
                          },
                        ),
                        labelText: "Password",
                        hintText: WomenCoCubit.GET(context).user.Phone),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  WomenCoButton(title: "APPLY CHANGES", onPressed: () {})
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

var userName_edit = TextEditingController();
var Email_edit = TextEditingController();
var phone_edit = TextEditingController();
var password_edit = TextEditingController();
