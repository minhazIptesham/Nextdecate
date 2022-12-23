import 'package:get/get.dart';

import '../controllers/brandwise_product_controller.dart';

class BrandwiseProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrandwiseProductController>(
      () => BrandwiseProductController(),
    );
  }
}
