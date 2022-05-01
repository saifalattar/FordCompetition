import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/view/navigation/navigation_screen.dart';

import 'view/Boarding/boarding_screens.dart';
import 'view/style/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ScreenUtilInit(
      builder: () {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: customSwatch,
          ),
          home: BoardingPage(),
          debugShowCheckedModeBanner: false,
        );
      },
      designSize: Size(414, 896),
    ));
  });
}
