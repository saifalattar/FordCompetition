import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco_vendors/view/applyNow1.dart';
import 'package:womenco_vendors/view/applyNow2.dart';
import 'package:womenco_vendors/view/boarding.dart';
import 'package:womenco_vendors/view/emailVerification.dart';
import 'package:womenco_vendors/view/homeScreens/home.dart';
import 'package:womenco_vendors/view/rquireSteps1.dart';
import 'package:womenco_vendors/view/signIn.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

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
    return BlocProvider(
      create: (context) => WomenCoCubitVendors(),
      child: BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                )),
            home: BoardingPage(),
            debugShowCheckedModeBanner: false,
            routes: {
              "/applyNow": (context) => ApplyNow(),
              "/emailVerify": (context) => EmailVerification(),
              "/applyNow_2": (context) => ApplyNow_2(),
              "/requiredSteps": (context) => RequiredSteps(),
              "/signIn": (context) => SignIn(),
              "/home": (context) => HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
