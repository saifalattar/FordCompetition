import 'package:flutter/material.dart';

// Color defaultColor=Colors.deepOrange;
const backgroundColor = const Color(0xFFFFF7F8);
const backgroundColor2 = const Color(0xFFFFA69E);
const buttonColor1 = const Color(0xFFA9F0D1);
const buttonColor2 = const Color(0xFFFF7E6B);
const TextColor1 = const Color(0xFF8C5E58);

Map<int, Color> color = {
  50: Color.fromRGBO(169, 240, 209, .1),
  100: Color.fromRGBO(169, 240, 209, .2),
  200: Color.fromRGBO(169, 240, 209, .3),
  300: Color.fromRGBO(169, 240, 209, .4),
  400: Color.fromRGBO(169, 240, 209, .5),
  500: Color.fromRGBO(169, 240, 209, .6),
  600: Color.fromRGBO(169, 240, 209, .7),
  700: Color.fromRGBO(169, 240, 209, .8),
  800: Color.fromRGBO(169, 240, 209, .9),
  900: Color.fromRGBO(169, 240, 209, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFA9F0D1, color);
