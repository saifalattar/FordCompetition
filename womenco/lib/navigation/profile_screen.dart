import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return SafeArea(child: Text('Profile Screen'));
  }
}
