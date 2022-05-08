import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/cubit/bloc.dart';
import 'package:womenco_vendors/cubit/states.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class ApplyNow_2 extends StatefulWidget {
  const ApplyNow_2({Key? key}) : super(key: key);

  @override
  State<ApplyNow_2> createState() => _ApplyNow_2State();
}

class _ApplyNow_2State extends State<ApplyNow_2> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocProvider(
      create: (context) => WomenCoCubitVendors(),
      child: BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
          builder: (context, states) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              ),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 67.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                controller: WomenCoCubitVendors.GET(context)
                                    .applyFirstName,
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                ),
                              ),
                              SizedBox(
                                height: 49.h,
                              ),
                              TextField(
                                controller: WomenCoCubitVendors.GET(context)
                                    .applyLastName,
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                ),
                              ),
                              SizedBox(
                                height: 49.h,
                              ),
                              TextField(
                                controller: WomenCoCubitVendors.GET(context)
                                    .applyPassword,
                                obscureText: WomenCoCubitVendors.GET(context)
                                    .isPasswordSecured,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    suffixIcon: IconButton(
                                      icon: WomenCoCubitVendors.GET(context)
                                              .isPasswordSecured
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          WomenCoCubitVendors.GET(context)
                                                  .isPasswordSecured =
                                              !WomenCoCubitVendors.GET(context)
                                                  .isPasswordSecured;
                                        });
                                      },
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 232.h,
                      ),
                      Container(
                        width: 60.w,
                        child:
                            WomenCoButton(context, title: ">", onPressed: () {
                          if (WomenCoCubitVendors.GET(context)
                                  .applyFirstName
                                  .text
                                  .isNotEmpty &&
                              WomenCoCubitVendors.GET(context)
                                  .applyLastName
                                  .text
                                  .isNotEmpty &&
                              WomenCoCubitVendors.GET(context)
                                  .applyPassword
                                  .text
                                  .isNotEmpty) {
                            Navigator.pushNamed(context, "/requiredSteps");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text("All fields are required")
                                ],
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }, color: Colors.pink[200]),
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
