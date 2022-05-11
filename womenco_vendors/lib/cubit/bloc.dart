import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  //----------------- variables of required page ------------------//
  bool isPhoneFinished = false;
  bool isPictureFinished = false;
  bool isIDFinished = false;
  bool isCriminalFinished = false;
  bool isServicesFinished = false;
  //-----------------------------------------------------------------//

  bool isPasswordSecured = true;

  File? profileImage;

  void addImage(String path) async {
    profileImage = File(path);
    ifProfileAdded = Text("dsds");
    emit(AddingImage());
  }
}
