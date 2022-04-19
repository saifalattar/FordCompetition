// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/shared/component/components.dart';
import 'home_screen.dart';
import 'order_screen.dart';
<<<<<<< HEAD
import 'profile screens/profile_screen.dart';
=======
import 'profile_screen.dart';
>>>>>>> 83c6799a291479c872d36c3920b81654b34b1693

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return Scaffold(
      bottomNavigationBar: customizedNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
          context: context),
      body: screens[_selectedIndex],
    );
  }
}
