import 'package:get/get.dart';

import '../controllers/product_wishlist_controller.dart';

class ProductWishlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductWishlistController>(
      () => ProductWishlistController(),
    );
  }
}
