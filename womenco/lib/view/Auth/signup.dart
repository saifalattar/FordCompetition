import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/view/style/colors.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';
import 'package:womenco/view/Auth/verification.dart';
import 'package:womenco/shared/component/components.dart';

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

    return BlocConsumer<WomenCoCubit, WomenCoStates>(
      listener: (context, states) {},
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
                      color: fontColor1,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir",
                    ),
                  ),
                  SizedBox(height: 51.h),
                  TextField(
                    controller: WomenCoCubit.GET(context).name_SignUp,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  SizedBox(height: 30.h),
                  TextField(
                    controller: WomenCoCubit.GET(context).email_SignUp,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  SizedBox(height: 30.h),
                  TextField(
                    controller: WomenCoCubit.GET(context).phone_SignUp,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: "Phone Number"),
                  ),
                  SizedBox(height: 30.h),
                  TextField(
                    controller: WomenCoCubit.GET(context).password_SignUp,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: WomenCoCubit.GET(context).isPasswordSecured,
                    decoration: InputDecoration(
                        labelText: "Password",
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
                        )),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      // Checkbox(
                      //     shape: CircleBorder(),
                      //     value: isAgree,
                      //     onChanged: (bool? isAgreed) {
                      //       setState(() {
                      //         isAgree = isAgreed;
                      //       });
                      //     }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //     Text("I agree to the"),
                          //     SizedBox(
                          //       height: 31.h,
                          //       child: TextButton(
                          //           onPressed: () {},
                          //           child: Text(
                          //             "Terms & Conditions",
                          //             style: TextStyle(
                          //               fontSize: 13,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           )),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Text("and"),
                          //     SizedBox(
                          //       height: 31.h,
                          //       child: TextButton(
                          //           onPressed: () {},
                          //           child: Text(
                          //             "Privacy & Policy",
                          //             style: TextStyle(
                          //               fontSize: 13,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           )),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: WomenCoButton(
                        title: "SIGN UP",
                        onPressed: () {
                          WomenCoCubit.GET(context).SignUp(context);
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

bool? isAgree = false;
