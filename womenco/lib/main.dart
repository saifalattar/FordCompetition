import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/view/Auth/login.dart';
import 'package:womenco/view/Auth/verification.dart';
import 'package:womenco/view/bookNow/cleaningBook.dart';
import 'package:womenco/view/navigation/home/cleaningScreens.dart';
import 'package:womenco/view/navigation/home/home_screen.dart';
import 'package:womenco/view/navigation/navigation_screen.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';

import 'view/Boarding/boarding_screens.dart';
import 'view/style/colors.dart';

void receiveNotification(context) async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    FlutterLocalNotificationsPlugin()
        .show(0, "dw", "body", NotificationDetails());
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) async {
    print("saaaaaaaaaaaaaaaaaaaaaaif");
    if (event.data['screen'] == "LogIn") {
      navkey.currentState!
          .push(MaterialPageRoute(builder: (context) => LogIn()));
    }
  });
}

var navkey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //print(await FirebaseMessaging.instance.getToken()); // to get the current device FCM token

  final FirebaseMessaging notifications = FirebaseMessaging.instance;

  NotificationSettings settings = await notifications.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  await notifications.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(UsersApp());
  });
}

class UsersApp extends StatelessWidget {
  const UsersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
        listener: (context, states) {},
        builder: (context, states) {
          receiveNotification(context);
          return ScreenUtilInit(
            builder: () {
              return MaterialApp(
                routes: {
                  "/cleaningPage": (context) => CleaningPage(),
                  "/navigationScreen": (context) => NavigationScreen(),
                  "/verification": (context) => VerificationPage()
                },
                navigatorKey: navkey,
                theme: ThemeData(
                  primarySwatch: customSwatch,
                ),
                home: NavigationScreen(),
                debugShowCheckedModeBanner: false,
              );
            },
            designSize: Size(414, 896),
          );
        },
      ),
    );
  }
}
