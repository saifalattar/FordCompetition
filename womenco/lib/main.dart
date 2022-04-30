import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/module/navigation/navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ScreenUtilInit(
      builder: () {
        return MaterialApp(
          home:
              NavigationScreen() //for authentication page write BoardingPage()
          ,
          debugShowCheckedModeBanner: false,
        );
      },
      designSize: Size(414, 896),
    ));
  });
}
