import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:womenco_vendors/cubit/bloc.dart';
import 'package:womenco_vendors/cubit/states.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocProvider(
        create: (context) => WomenCoCubitVendors(),
        child: BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
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
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: 414.w,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Verification",
                          style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[300])),
                      SizedBox(height: 20.h),
                      Text(
                        """Enter the verification code we just sent you on your Email Address""",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 113.h,
                      ),
                      PinCodeTextField(
                          keyboardType: TextInputType.number,
                          appContext: context,
                          length: 6,
                          onChanged: (text) {
                            verificationCode = text;
                          }),
                      SizedBox(
                        height: 51.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You didn't receive a code ?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "RESEND",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 225.5.h,
                      ),
                      Container(
                        width: 364.w,
                        height: 46.h,
                        child: ElevatedButton(
                            onPressed: verificationCode.length < 6
                                ? null
                                : () {
                                    Navigator.pushNamed(context, "/applyNow_2");
                                  },
                            child: Text(
                              "VERIFY",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: verificationCode.length < 6
                                      ? Colors.grey[700]
                                      : Colors.white),
                            ),
                            style: ButtonStyle(
                                enableFeedback: true,
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    verificationCode.length < 6
                                        ? Colors.grey[300]
                                        : Colors.pink[200]))),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

String verificationCode = "";
