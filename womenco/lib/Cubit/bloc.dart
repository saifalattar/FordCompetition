import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco/Cubit/states.dart';

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
}
