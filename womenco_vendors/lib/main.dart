import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/view/applyNow1.dart';
import 'package:womenco_vendors/view/applyNow2.dart';
import 'package:womenco_vendors/view/boarding.dart';
import 'package:womenco_vendors/view/emailVerification.dart';
import 'package:womenco_vendors/view/homeScreens/firstTimeLanguage.dart';
import 'package:womenco_vendors/view/homeScreens/home.dart';
import 'package:womenco_vendors/view/rquireSteps1.dart';
import 'package:womenco_vendors/view/signIn.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

Future<bool> languageCheck() async {
  SharedPreferences localData = await local;
  bool? lang = localData.getBool("Language");
  print(lang);
  if (lang == true || lang == false) {
    return true;
  } else {
    return false;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(await languageCheck()
        ? /*VendorApp()*/ BlocProvider(
            create: (context) => WomenCoCubitVendors(),
            child: MaterialApp(home: HomeScreen()))
        : Language());
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
                appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                )),
            home: BoardingPage(),
            debugShowCheckedModeBanner: false,
            routes: {
              "/applyNow": (context) => const ApplyNow(),
              // "/emailVerify": (context) => EmailVerification(),
              "/applyNow_2": (context) => const ApplyNow_2(),
              "/requiredSteps": (context) => const RequiredSteps(),
              "/signIn": (context) => const SignIn(),
              "/home": (context) => const HomeScreen(),
              "/boarding": (context) => const BoardingPage(),
            },
          );
        },
      ),
    );
  }
}
