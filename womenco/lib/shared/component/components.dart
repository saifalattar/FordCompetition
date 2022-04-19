// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customizedNavBar({
  required var selectedIndex,
  required var onItemTapped,
  required var context,
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_outlined),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
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
<<<<<<< HEAD

Widget WomenCoButton({required String title, required Function() onPressed}) {
  return Container(
    width: 364.w,
    height: 46.h,
    child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            enableFeedback: true,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.pink[200]))),
  );
}
=======
>>>>>>> 83c6799a291479c872d36c3920b81654b34b1693
