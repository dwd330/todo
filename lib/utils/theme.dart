import 'package:flutter/material.dart';

//color paltte
const Color mainColor = Color.fromARGB(255, 14, 47, 130);
const Color darkGreyClr = Color.fromARGB(220, 119, 100, 100);
const Color darkbgClr = Color(0xFF474444);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color.fromARGB(218, 23, 103, 232);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color.fromARGB(255, 81, 142, 125);
const Color kCOlor5 = Color(0xff6D454D);
const Color kCOlor6 = Color.fromARGB(57, 155, 168, 159);
const Color kCOlor7 = Color.fromARGB(202, 209, 224, 228);
const kPrimaryColor = Color.fromARGB(255, 27, 5, 124);
const inactiveColor = Color(0xFFb36365);
const bgcolorlite = Color.fromARGB(132, 241, 244, 245);

class ThemesApp {
  static final light = ThemeData(
    fontFamily: "Tajawal",
    primaryColor: mainColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: kCOlor4)
        .copyWith(background: Colors.white),
  );

//not used
  static final dark = ThemeData(
      fontFamily: "Tajawal",
      primaryColor: darkGreyClr,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: kCOlor4)
          .copyWith(background: darkbgClr));
}
