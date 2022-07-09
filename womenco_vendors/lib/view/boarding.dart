import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        builder: (context, states) {
          return Scaffold(
            body: Container(
              width: 414.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.asset(
                        "assets/boarding.png",
                        height: 642.h,
                      )),
                  Text(
                    "Welcome to \nWomenCo Vendors",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        WomenCoButton(context,
                            title: "Apply Now",
                            textColor: Colors.white, onPressed: () {
                          Navigator.pushNamed(context, "/applyNow");
                        }, color: Colors.pink[200]),
                        WomenCoButton(context,
                            title: "Sign In",
                            textColor: Colors.grey, onPressed: () {
                          Navigator.pushNamed(context, "/signIn");
                        }, color: Colors.grey[200])
                      ]))
                ],
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}
