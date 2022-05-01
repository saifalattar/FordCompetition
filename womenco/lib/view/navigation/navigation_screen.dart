// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/view/navigation/home/home_screen.dart';
import 'package:womenco/view/navigation/order_screen.dart';
import 'package:womenco/view/navigation/profile/profile_screen.dart';
import 'package:womenco/shared/component/components.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubit, WomenCoStates>(
      listener: (context, states) {},
      builder: (context, states) {
        WomenCoCubit cubit = WomenCoCubit.GET(context);
        return Scaffold(
          bottomNavigationBar: customizedNavBar(
              bottomItemsList: cubit.bottomItems,
              selectedIndex: cubit.currentIndex,
              onItemTapped: (index) {
                cubit.changeBottomNav(index);
              },
              context: context),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
