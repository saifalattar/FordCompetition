import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/Boarding/Auth/signup.dart';
import 'package:womenco/Boarding/Auth/verification.dart';
import 'package:womenco/Boarding/boarding_screens.dart';
import 'package:womenco/Cubit/bloc.dart';
import 'package:womenco/Cubit/states.dart';

import 'navigation/navigation_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ScreenUtilInit(
      builder: () {
        return MaterialApp(
          home: NavigationScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
      designSize: Size(414, 896),
    ));
  });
}
