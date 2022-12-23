import 'package:get/get.dart';

import '../controllers/allproduct_controller.dart';

class AllproductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllproductController>(
      () => AllproductController(),
    );
  }
}
