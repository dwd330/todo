import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/text_input.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.only(top: 10.h),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            Color.fromARGB(255, 231, 198, 227),
            Color.fromARGB(105, 240, 225, 244),
            Color.fromARGB(155, 193, 226, 238)
          ],
        )),
        child: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: TextInput(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    text: " login",
                    color: Colors.black),
              ),
              Expanded(flex: 6, child: LoginForm()),
            ],
          ),
        ),
      )),
    ));
  }
}
