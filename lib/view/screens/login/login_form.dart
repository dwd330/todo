import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:todo/database/local_DB/collections/todo.dart';

import '../../../logic/controllers/main_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';
import '../../widgets/text_input.dart';

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
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.sp),
                topRight: Radius.circular(30.sp))),
        padding: EdgeInsets.all(8.sp),
        height: 70.h,
        child: Form(
          child: Column(
            // key: _formKey,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextInput(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      text: "email *",
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: TextFormField(
                  controller: _username,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "enter your email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(
                      fontSize: 10.sp,
                      color: kCOlor2,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(156, 234, 232, 232),
                    contentPadding:
                        EdgeInsets.only(left: 5.w, bottom: 3.h, top: 3.h),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextInput(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      text: "Password *",
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: TextFormField(
                  controller: _passwordController,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "enter your password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: kCOlor2,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(156, 234, 232, 232),
                    contentPadding:
                        EdgeInsets.only(left: 5.w, bottom: 3.h, top: 3.h),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                  obscureText: true,
                  autocorrect: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () async {
                  //test get all users
                  //   final userslist = await HttpHandler().getusers();
                  final todo = Todo()
                    ..name = "ola"
                    ..descripion = "fefeff fefmmmooof feoos"
                    ..color = "red"
                    ..date = "12 mfs";
                  controller.addTodo(todo);
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
                      "error",
                      "incorrect email or passowrd,please try again",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(milliseconds: 1000),
                    );
                  }
                },
                child: Container(
                  width: 77.w,
                  height: 8.h,
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
                    child: TextInput(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        text: " sign in",
                        color: Colors.white),
                  ),
                ),
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
