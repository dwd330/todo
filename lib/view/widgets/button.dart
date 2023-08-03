import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sizer/sizer.dart';

import '../../utils/theme.dart';
import 'text_input.dart';

class AppButton extends StatelessWidget {
  final String textvalue;
  final double? width;
  final double? height;
  final double? fontsize;
  final Callback onPressed;
  final ButtonStyle? style;

  const AppButton({
    required this.textvalue,
    required this.onPressed,
    this.width,
    this.height,
    this.fontsize,
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blue,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        height: height ?? 9.h,
        width: width ?? 20.w,
        child: ElevatedButton(
          style: style ?? style1,
          onPressed: onPressed,
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
