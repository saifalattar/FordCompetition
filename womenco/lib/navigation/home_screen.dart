// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/shared/component/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Placeholder for searchbar
            SizedBox(
              height: 150.h,
            ),

            //Services Offered
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                serviceTile(
                    context: context,
                    color1: Color(0XFF84D2F4),
                    color2: Color(0XFF57B7EB),
                    serviceName: "Cleaning",
                    serviceImage: "assets/cleaning.png"),
                serviceTile(
                    context: context,
                    color1: Color(0XFFFBF392),
                    color2: Color(0XFFF9EE64),
                    serviceName: "Cooking",
                    serviceImage: "assets/cooking.png"),
                serviceTile(
                    context: context,
                    color1: Color(0XFFFD8087),
                    color2: Color(0XFFFE636E),
                    serviceName: "Nursing",
                    serviceImage: "assets/nursing.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
