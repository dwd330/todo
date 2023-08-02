import 'package:get/instance_manager.dart';

import '../controllers/app_controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(Appcontroller());
  }
}
