import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco/Cubit/states.dart';
import 'package:womenco/shared/component/orderClass.dart';
import 'package:womenco/shared/component/userClass.dart';
import 'package:womenco/shared/workerClass.dart';

class WomenCoCubit extends Cubit<WomenCoStates> {
  WomenCoCubit() : super(InitialState());
  static WomenCoCubit GET(context) => BlocProvider.of(context);

  bool isPasswordSecured = true;

  var email_SignUp = TextEditingController();
  var email_LogIn = TextEditingController();

  var password_SignUp = TextEditingController();
  var password_LogIn = TextEditingController();

  var name_SignUp = TextEditingController();

  var phone_SignUp = TextEditingController();

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
}
