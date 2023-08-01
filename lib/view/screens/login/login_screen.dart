import 'package:flutter/material.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 231, 237, 190),
                    Color.fromARGB(223, 47, 178, 229)
                  ],
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 270),
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
