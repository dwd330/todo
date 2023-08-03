import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view/widgets/custom_background.dart';
import '../../widgets/text_input.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: CustomBackground(
          widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 11.h, left: 5.w),
              child: TextInputWidget(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  text: " Login",
                  color: Colors.black),
            ),
          ),
          const Expanded(flex: 7, child: LoginForm()),
        ],
      )),
    )));
  }
}
