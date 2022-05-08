import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:womenco_vendors/applyNow1.dart';
import 'package:womenco_vendors/boarding.dart';
import 'package:womenco_vendors/rquireSteps1.dart';
import 'package:womenco_vendors/shared/component/applyNow2.dart';
import 'package:womenco_vendors/verification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(VendorApp());
  });
}

class VendorApp extends StatefulWidget {
  const VendorApp({Key? key}) : super(key: key);

  @override
  State<VendorApp> createState() => _VendorAppState();
}

class _VendorAppState extends State<VendorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
          )),
      home: BoardingPage(),
      routes: {
        "/applyNow": (context) => ApplyNow(),
        "/applyNow_2": (context) => ApplyNow_2(),
        "/requiredSteps": (context) => RequiredSteps(),
        "/verification": (context) => VerificationPage()
      },
    );
  }
}
