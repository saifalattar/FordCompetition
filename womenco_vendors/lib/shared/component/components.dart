import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget WomenCoButton(BuildContext context,
    {required String title,
    required Function() onPressed,
    Color? color,
    Color? textColor}) {
  ScreenUtil.init(context, designSize: Size(414, 896));
  return Container(
    width: 364.w,
    height: 46.h,
    child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            enableFeedback: true,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(color))),
  );
}
