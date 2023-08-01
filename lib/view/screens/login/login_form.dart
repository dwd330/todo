import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../../../database/remote/http_handler.dart';
import '../../../logic/controllers/main_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';
import '../../widgets/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final controller = Get.find<MainController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50.w,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                controller: _username,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    icon: const Icon(
                      Icons.person,
                      color: kCOlor2,
                    ),
                    labelText: "اسم المستخدم",
                    labelStyle: TextStyle(
                      fontSize: 10.sp,
                      color: kCOlor2,
                    ),
                    filled: true,
                    fillColor: Colors.white54),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (_) {
                  return null;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    icon: const Icon(
                      Icons.lock,
                      color: kCOlor2,
                    ),
                    labelText: "كلمة المرور",
                    labelStyle: TextStyle(
                      fontSize: 10.sp,
                      color: kCOlor2,
                    ),
                    filled: true,
                    fillColor: Colors.white54),
                obscureText: true,
                autocorrect: false,
                validator: (_) {
                  return null;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              AppButton(
                width: 180,
                height: 70,
                onPressed: () async {
                  //test get all users
                  //   final userslist = await HttpHandler().getusers();
                  /*   final user = User()
                    ..name = "ola"
                    ..password = "33333"
                    ..role = "admin"
                    ..phone = "1022323"; */
                  //post user
                  //  print(await HttpHandler().postuser(user));

                  //query input for user if fount => set as current user
                  //else show error
                  //if no users => go to dashboard

                  final login = await controller.isLoggedIn(
                      username: _username.text.trim(),
                      password: _passwordController.text.trim());

                  if (login == true) {
                    Get.offAllNamed(Routes.mainscreen);
                  } else {
                    Get.snackbar(
                      "خطاء",
                      "اسم المستخدم أو كلمة المرور غير صحيحة",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(milliseconds: 1000),
                    );
                  }
                },
                textvalue: "دخول",
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _passwordController.dispose();
  }
}
