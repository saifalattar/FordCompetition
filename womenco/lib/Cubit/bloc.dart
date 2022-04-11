import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco/Cubit/states.dart';

class WomenCoCubit extends Cubit<WomenCoStates> {
  WomenCoCubit() : super(InitialState());
  static WomenCoCubit GET(context) => BlocProvider.of(context);

  void saif() {
    print("done");
  }
}
