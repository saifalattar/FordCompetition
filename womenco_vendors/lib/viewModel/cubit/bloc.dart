import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco_vendors/view/subScreens/profilePhotoScreen.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

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
  File? profileImage;
  File? criminalChip;

  String? selectedService;
  String emailVerificationCode = "";
  String phoneVerificationCode = "";

  //----------------- variables of required page ------------------//
  bool isPhoneFinished = false;
  bool isPictureFinished = false;
  bool isIDFinished = false;
  bool isCriminalFinished = false;
  bool isServicesFinished = false;
  bool isPasswordSecured = true;

  //-------------------------Methods---------------------------//

  void AddPhoneNumber() {
    isPhoneFinished = true;
    emit(PhoneNumberAdded());
  }

  void addProfileImage(String path) async {
    profileImage = File(path);
    isPictureFinished = true;
    emit(ImageAdded());
  }

  void addNationalID() {
    isIDFinished = true;
    emit(NationalIDAdded());
  }

  void addCriminalChip(String path) async {
    criminalChip = File(path);
    isCriminalFinished = true;
    emit(CriminalChipAdded());
  }

  void addService() {
    isServicesFinished = true;
    emit(ServicesAdded());
  }
}
