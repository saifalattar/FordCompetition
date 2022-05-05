// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/view/style/colors.dart';

Widget customizedNavBar({
  required var selectedIndex,
  required var onItemTapped,
  required var context,
  required var bottomItemsList,
}) {
  ScreenUtil.init(BoxConstraints(),
      context: context, designSize: Size(414, 896));

  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0XFFFFECEC).withOpacity(0.1),
        Color(0XFFFFECED),
      ],
    )),
    child: Container(
      width: 354.w,
      height: 87.h,
      margin: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(27.0),
        child: BottomNavigationBar(
          unselectedItemColor: Color(0XFFB1B1B1),
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: bottomItemsList,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    ),
  );
}

Widget serviceTile({
  required var context,
  required Color color1,
  required Color color2,
  required String serviceName,
  required String serviceImage,
}) {
  ScreenUtil.init(BoxConstraints(),
      context: context, designSize: Size(414, 896));

  return Expanded(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: 118.w,
          height: 118.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color1,
                color2,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              serviceName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          child: Image(height: 132.h, image: AssetImage(serviceImage)),
        ),
      ],
    ),
  );
}

Widget WomenCoButton(
    {required String title,
    required Function() onPressed,
    Color? color = buttonColor1}) {
  return Container(
    width: 364.w,
    height: 46.h,
    child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            enableFeedback: true,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(color))),
  );
}

// The one for google & facebook signup option
Widget WomenCoButton2(
    {required String title,
    required Function() onPressed,
    Color? color = Colors.white}) {
  return Container(
    width: 318.w,
    height: 58.h,
    child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.grey, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            enableFeedback: true,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(color))),
  );
}

Widget settingsButton(
    {required String title,
    required IconData icon,
    required Function() onPressed}) {
  return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          )
        ],
      ));
}

Widget customizedPageViewItem({
  required String image,
  required String headline,
  required String description,
}) =>
    Column(
      children: [
        Image.asset(
          "${image}",
          height: 532.h,
          width: 414.w,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "${headline}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            """${description}""",
            style: TextStyle(fontSize: 20, color: Colors.grey),
            maxLines: 3,
          ),
        )
      ],
    );

AppBar customizedAppBar(var context) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
    );

Widget customizedDivider() => Column(
      children: [
        SizedBox(height: 25.h),
        const Divider(
          thickness: 0,
          color: Colors.grey,
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );

//