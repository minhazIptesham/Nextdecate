import 'package:gameleven/app/init_first_controller/init_first_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InitFirstController>(InitFirstController(), permanent: true);
  }
}
