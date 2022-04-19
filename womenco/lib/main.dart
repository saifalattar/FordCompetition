import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'navigation/navigation_screen.dart';

<<<<<<< HEAD
void main() {
=======
import 'navigation/navigation_screen.dart';

Future<void> main() async {
>>>>>>> 83c6799a291479c872d36c3920b81654b34b1693
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ScreenUtilInit(
      builder: () {
        return MaterialApp(
<<<<<<< HEAD
          home:
              NavigationScreen() //for authentication page write BoardingPage()
          ,
=======
          home: NavigationScreen(),
>>>>>>> 83c6799a291479c872d36c3920b81654b34b1693
          debugShowCheckedModeBanner: false,
        );
      },
      designSize: Size(414, 896),
    ));
  });
}
