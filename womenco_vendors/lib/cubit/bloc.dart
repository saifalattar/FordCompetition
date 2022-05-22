import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco_vendors/cubit/states.dart';
import 'package:womenco_vendors/subScreens/profilePhotoScreen.dart';

class WomenCoCubitVendors extends Cubit<WomenCoStatesVendors> {
  WomenCoCubitVendors() : super(InitialState());

//-----------------------------Constructor-----------------------------//

  static WomenCoCubitVendors GET(context) => BlocProvider.of(context);

//-----------------------------Variables-----------------------------//

  var applyEmail = TextEditingController();
  var applyFirstName = TextEditingController();
  var applyLastName = TextEditingController();
  var applyPassword = TextEditingController();

  var nationalID = TextEditingController();

  var phoneNumber = TextEditingController();

  bool isPasswordSecured = true;

  File? profileImage;

  String? selectedService;

  static const String BASE_URL = "https://api.womencoeg.com";

  //----------------- variables of required page ------------------//
  bool isPhoneFinished = false;
  bool isPictureFinished = false;
  bool isIDFinished = false;
  bool isCriminalFinished = false;
  bool isServicesFinished = false;
  //-----------------------------------------------------------------//

  void addProfileImage(String path) async {
    profileImage = File(path);
    emit(AddingImage());
  }

  void logIn(BuildContext context, String phone, String password) async {
    await Dio()
        .post("$BASE_URL/vendor/login", data: {
          {"phone": phone, "password": password}
        })
        .then((value) => null)
        .catchError((error) {
          return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: [
                Icon(Icons.error),
                SizedBox(width: 20),
                Text("$error"),
              ],
            ),
            backgroundColor: Colors.red,
          ));
        });
  }
}
