import 'package:get/get.dart';

import '../controllers/product_cart_controller.dart';

class ProductCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductCartController>(
      () => ProductCartController(),
    );
  }
}
