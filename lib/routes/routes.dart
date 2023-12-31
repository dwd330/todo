import 'package:get/get.dart';

import '../logic/bindings/main_binding.dart';
import '../view/screens/login/login_screen.dart';
import '../view/screens/mainScreen/main_screen.dart';

class AppRoutes {
  //initialRoute
  static const startscreen = Routes.loginScreen;
  static const mainscreen = Routes.mainscreen;
  //getPages
  static final routes = [
    GetPage(
      name: Routes.mainscreen,
      page: () => const MainScreen(),
      bindings: [
        MainBininding(),
      ],
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      bindings: [
        MainBininding(),
      ],
    ),
  ];
}

class Routes {
  static const mainscreen = '/mainscreen';
  static const loginScreen = '/loginScreen';
}
