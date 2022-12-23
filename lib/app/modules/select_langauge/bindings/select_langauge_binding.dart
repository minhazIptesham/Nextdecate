import 'package:get/get.dart';

import '../controllers/select_langauge_controller.dart';

class SelectLangaugeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLangaugeController>(
      () => SelectLangaugeController(),
    );
  }
}
