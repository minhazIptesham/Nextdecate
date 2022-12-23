import 'package:get/get.dart';

import '../controllers/coupon_controller.dart';

class CouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponController>(
      () => CouponController(),
    );
  }
}
