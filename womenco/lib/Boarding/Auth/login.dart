import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/Boarding/Auth/signup.dart';
import 'package:womenco/Cubit/bloc.dart';
import 'package:womenco/Cubit/states.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 25.h),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                          "Welcome \nBack",
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 60.h),
                        TextField(
                          controller: WomenCoCubit.GET(context).email_LogIn,
                          decoration: InputDecoration(labelText: "Email"),
                        ),
                        SizedBox(height: 30.h),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText:
                              WomenCoCubit.GET(context).isPasswordSecured,
                          decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon:
                                    WomenCoCubit.GET(context).isPasswordSecured
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    WomenCoCubit.GET(context)
                                            .isPasswordSecured =
                                        !WomenCoCubit.GET(context)
                                            .isPasswordSecured;
                                  });
                                },
                              )),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text("Forgot your password ?")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Center(
                          child: Container(
                            width: 364.w,
                            height: 46.h,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account ? "),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text("Sign Up"))
                          ],
                        )
                      ])),
                ));
          },
          listener: (context, states) {}),
    );
  }
}
