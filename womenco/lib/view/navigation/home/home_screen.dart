// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/view/navigation/home/cleaningcreens.dart';
import 'package:womenco/view/navigation/home/cookingScreens.dart';
import 'package:womenco/view/navigation/home/nursingScreens.dart';
import 'package:womenco/shared/component/components.dart';
import 'package:womenco/model/workerClass.dart';
import 'package:womenco/view/style/colors.dart';

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CleaningPage()));
                  },
                  child: serviceTile(
                      context: context,
                      color1: cleaningColor1,
                      color2: cleaningColor2,
                      serviceName: "Cleaning",
                      serviceImage: "assets/cleaning.png"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CookingPage()));
                  },
                  child: serviceTile(
                      context: context,
                      color1: cookingColor1,
                      color2: cookingColor2,
                      serviceName: "Cooking",
                      serviceImage: "assets/cooking.png"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NursingPage()));
                  },
                  child: serviceTile(
                      context: context,
                      color1: nursingColor1,
                      color2: nursingColor2,
                      serviceName: "Nursing",
                      serviceImage: "assets/nursing.png"),
                ),
              ],
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Worker(
                              imageURL: "",
                              name: "AnyBody",
                              lastOrderDate_Day: 3,
                              lastOrderDate_Month: 5,
                              lastOrderDate_Year: 2022,
                              profession: "Cleaning",
                              numOfOrders: 54,
                              rate: 2.75,
                              availability: false)));
                },
                child: Text("Just to see the worker page "))
          ],
        ),
      ),
    );
  }
}
