import 'package:get/get.dart';

import '../controllers/morevall_product_controller.dart';

class MorevallProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MorevallProductController>(
      () => MorevallProductController(),
    );
  }
}
