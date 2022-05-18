import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class ApplyNow extends StatefulWidget {
  const ApplyNow({Key? key}) : super(key: key);

  @override
  State<ApplyNow> createState() => _ApplyNowState();
}

class _ApplyNowState extends State<ApplyNow> {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Apply\nNow",
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 67.h,
                              ),
                              TextField(
                                controller:
                                    WomenCoCubitVendors.GET(context).applyEmail,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 60.w,
                        child:
                            WomenCoButton(context, title: ">", onPressed: () {
                          if (WomenCoCubitVendors.GET(context)
                              .applyEmail
                              .text
                              .isNotEmpty) {
                            Navigator.pushNamed(context, "/emailVerify");
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
                                  Text("Email field is empty")
                                ],
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }, color: Colors.pink[200]),
                      )
                    ],
                  ),
                ));
          },
          listener: (context, states) {}),
    );
  }
}
