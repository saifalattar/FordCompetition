// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womenco/model/orderClass.dart';
import 'package:womenco/model/userClass.dart';
import 'package:womenco/model/workerClass.dart';
import 'package:womenco/view/finalizingOrder.dart';
import 'package:womenco/view/navigation/home/home_screen.dart';
import 'package:womenco/view/navigation/order_screen.dart';
import 'package:womenco/view/navigation/profile/profile_screen.dart';
import 'package:womenco/viewModel/cubit/states.dart';

class WomenCoCubit extends Cubit<WomenCoStates> {
  WomenCoCubit() : super(InitialState());
  //-----------------------------Constructor-----------------------------//

  static WomenCoCubit GET(context) => BlocProvider.of(context);

//-----------------------------Variables-----------------------------//
  String BASE_URL = "https://api.womencoeg.com";
  String? userToken;

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
        deliveryTime: TimeOfDay.now(),
        vendorPhoneNumber: "00207466457",
        orderID: "2929382d",
        deliveryDate: DateTime.now(),
        type: orderTypes.Cleaning,
        status: orderStatus.Pending,
        address: "october",
        day: 20,
        year: 2022,
        month: 3,
        price: 122),
    Order(
        deliveryDate: DateTime.now(),
        deliveryTime: TimeOfDay.now(),
        vendorPhoneNumber: "00207466457",
        orderID: "98787654h",
        type: orderTypes.Cleaning,
        status: orderStatus.Completed,
        address: "Cairo",
        month: 2,
        day: 8,
        year: 2022,
        price: 988),
  ]; //to get all user's orders and put interact with them in orders screen page

  List<Worker> allCleaningWorkers = [
    Worker(
        imageURL: "",
        name: "saif",
        profession: "Cleaner",
        numOfOrders: 20,
        rate: 4.3,
        availability: true,
        lastOrderDate_Day: 11,
        lastOrderDate_Month: 12,
        lastOrderDate_Year: 2002)
  ]; //to add all workers in cleaning from database
  List<Worker> allCookingWorkers =
      []; //to add all workers in cooking from database
  List<Worker> allNursingWorkers =
      []; //to add all workers in nursing from database

  // finishing order variables

  //-----------------------------Methods-----------------------------//

  String getMonthFromNum(int monthNum) {
    List months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[monthNum - 1];
  }

  void addCurrentOrder(Order order) {
    currentOrder = order;
  }

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  void SignUp(BuildContext context) async {
    await Dio()
        .post("$BASE_URL/user/signup", data: {
          "name": name_SignUp.text,
          "email": email_SignUp.text,
          "password": password_SignUp.text,
          "phone": phone_SignUp.text
        })
        .then((value) => Navigator.pushNamed(context, "/verification"))
        .catchError((onError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(onError.response.data['message'])
                ],
              )));
        });
  }

  void Login(context) async {
    await Dio().post("$BASE_URL/user/login", data: {
      "email": email_LogIn.text,
      "password": password_LogIn.text
    }).then((value) async {
      SharedPreferences localDataBase = await SharedPreferences.getInstance();
      await localDataBase
          .setString("token", value.data['data']['token'])
          .then((value) => Navigator.pushNamed(context, "/navigationScreen"));
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text(onError.response.data['message'])
            ],
          )));
    });
  }
}
