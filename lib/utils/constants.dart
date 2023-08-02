import 'package:flutter/material.dart';

final ButtonStyle style1 = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 27, 75, 166),
    textStyle: const TextStyle(fontSize: 33));

final ButtonStyle style2 = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 163, 104, 83),
    textStyle: const TextStyle(fontSize: 33));
final ButtonStyle style3 = ElevatedButton.styleFrom(
  elevation: 0,
  foregroundColor: Colors.white,
  backgroundColor: const Color.fromARGB(221, 19, 119, 213),
);
//color paltte
const Color mainColor = Color.fromARGB(255, 22, 4, 75);

//get_storage key
const String isusertoken = "isusertoken";
const String usertokenkey = "usertokenrolekey";
