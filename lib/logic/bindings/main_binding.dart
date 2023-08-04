import 'package:get/instance_manager.dart';
import 'package:todo/logic/controllers/app_controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(Appcontroller(), permanent: true);
  }
}
