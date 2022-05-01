// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco/model/orderClass.dart';
import 'package:womenco/model/userClass.dart';
import 'package:womenco/model/workerClass.dart';
import 'package:womenco/view/navigation/home/home_screen.dart';
import 'package:womenco/view/navigation/order_screen.dart';
import 'package:womenco/view/navigation/profile/profile_screen.dart';
import 'package:womenco/viewModel/cubit/states.dart';

class WomenCoCubit extends Cubit<WomenCoStates> {
  WomenCoCubit() : super(InitialState());
  //-----------------------------Constructor-----------------------------//

  static WomenCoCubit GET(context) => BlocProvider.of(context);

//-----------------------------Variables-----------------------------//
  bool isPasswordSecured = true;

  var email_SignUp = TextEditingController();
  var email_LogIn = TextEditingController();

  var password_SignUp = TextEditingController();
  var password_LogIn = TextEditingController();

  var name_SignUp = TextEditingController();

  var phone_SignUp = TextEditingController();

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.receipt_outlined),
      label: 'Orders',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_rounded),
      label: 'Profile',
    ),
  ];

  User user = User(
      Name: "saif",
      Email: "saif@gmail.com",
      Phone: "01157131310",
      profileImageURL: ""); //the current user

  List<Order> allOrders = [
    Order(
        type: orderTypes.Cleaning,
        status: orderStatus.Pending,
        address: "october",
        day: 20,
        year: 2022,
        month: 3,
        price: 122),
    Order(
        type: orderTypes.Cleaning,
        status: orderStatus.Completed,
        address: "Cairo",
        month: 2,
        day: 8,
        year: 2022,
        price: 988),
  ]; //to get all user's orders and put interact with them in orders screen page

  List<Worker> allCleaningWorkers =
      []; //to add all workers in cleaning from database
  List<Worker> allCookingWorkers =
      []; //to add all workers in cooking from database
  List<Worker> allNursingWorkers =
      []; //to add all workers in nursing from database

  //-----------------------------Methods-----------------------------//
  void changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
