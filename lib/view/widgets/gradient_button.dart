import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/logic/controllers/app_controller.dart';

import 'text_input.dart';

class Gradientbutton extends StatelessWidget {
  Gradientbutton({
    super.key,
    required this.onPressed,
    required this.textvalue,
    this.width,
    this.height,
    this.fontsize,
  });

  final Function() onPressed;
  final String textvalue;
  final double? width;
  final double? height;
  final double? fontsize;
  final controller = Get.find<Appcontroller>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 9.h,
        width: width ?? 20.w,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(157, 61, 205, 253),
                Color.fromARGB(224, 7, 76, 237),
              ],
            )),
        child: Center(
          child: TextInputWidget(
              fontSize: fontsize ?? 8.sp,
              fontWeight: FontWeight.bold,
              text: textvalue,
              color: Colors.white),
        ),
      ),
    );
  }
}
