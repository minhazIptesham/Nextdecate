import 'package:get/get.dart';

import '../controllers/giftcard_controller.dart';

class GiftcardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftcardController>(
      () => GiftcardController(),
    );
  }
}
