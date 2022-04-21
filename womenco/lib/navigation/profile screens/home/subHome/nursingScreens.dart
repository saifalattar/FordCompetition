import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco/Cubit/bloc.dart';
import 'package:womenco/Cubit/states.dart';

class NursingPage extends StatefulWidget {
  const NursingPage({Key? key}) : super(key: key);

  @override
  State<NursingPage> createState() => _NursingPageState();
}

class _NursingPageState extends State<NursingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
          builder: (context, states) {
            return Scaffold();
          },
          listener: (context, states) {}),
    );
  }
}
