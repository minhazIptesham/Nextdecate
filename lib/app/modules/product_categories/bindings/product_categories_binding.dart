import 'package:get/get.dart';

import '../controllers/product_categories_controller.dart';

class ProductCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductCategoriesController>(
      () => ProductCategoriesController(),
    );
  }
}
