import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/view/bookNow/cleaningBook.dart';
import 'package:womenco/view/navigation/navigation_screen.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';

import 'view/Boarding/boarding_screens.dart';
import 'view/style/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return ScreenUtilInit(
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
          );
        },
      ),
    );
  }
}
