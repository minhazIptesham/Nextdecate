import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_details_model.dart';
import '../../../data/models/product_related_model.dart';
import '../../../data/models/review_model.dart';
import '../../../data/repositories/nav_wishlist_reposities.dart';
import '../../../data/repositories/product_details_reposities.dart';
import '../../product_wishlist/controllers/product_wishlist_controller.dart';

class ProductDetailsController extends GetxController {
  //TODO: Implement ProductDetailsController
    final wishCTR= Get.find<ProductWishlistController>();
  final count = 0.obs;

  final selectedColor = 0.obs;
   final List<Color> colors = [
    Color(0xFF000000),
    Color(0xFFFFFFFF),
    Color(0xFF947867),
    Color(0xFFC89234),
    Color(0xFF862F07),
    Color(0xFF2F1B15),
  ].obs;

  var productDetailsInfo= ProductDetailsModel().obs;

  var productDetailsRelatedInfo= ProductRelatedModel().obs;

  final isLoadingData=false.obs;
  final isLoadingRelatedData=false.obs;

   final productId='0'.obs;

   final isLoadingAddWishData=false.obs;
   final wishMsg=''.obs;

   final productCategoryId='0'.obs;

  var productRelatedList = [].obs;

  var productReviewList = [].obs;

  final selectedSize = 0.obs;

   final List<String> sizes = [
    'Small',
    'Midiam',
    'large'
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  productDetailsCTR(){
    isLoadingData.value=false;
    ProductDetailsInfoRepo().productDetailsBYIdRepo(productId.value).then((resValue) async {

      var bodyMap = json.decode(resValue.body);
      if(bodyMap==null){
        Get. back();
      }
      if (bodyMap['product_info']!= null) {
        productDetailsInfo.value =ProductDetailsModel.fromJson(bodyMap['product_info']);
        isLoadingData.value=true;
        if (kDebugMode) {
          print('Product Details item Name:${productDetailsInfo.value.name}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
        print('Error : $stackTrace');
      }
    });
  }
  /// Related Products
  productDetailsRelatedCTR() {
    productRelatedList.clear();
    ProductDetailsInfoRepo().productDetailsRelatedBYIdRepo(productId.value,productCategoryId.value).then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      if (bodyMap['related_products'] != null) {
        for (var products in bodyMap['related_products']) {
          productRelatedList.add(ProductRelatedModel.fromJson(products));
        }
        if (kDebugMode) {
          print('Best Sale lng:${productRelatedList.length}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
        print('Error : $stackTrace');
      }
    });
  }
  /// Review List
  reviewListByProductCTR() {
    productReviewList.clear();
    ProductDetailsInfoRepo().reviewListBYProductIdRepo(productId.value).then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      if (bodyMap['status'] != 'error') {
        for (var data in bodyMap['review_info']) {
          productReviewList.add(ReviewModel.fromJson(data));
        }
        if (kDebugMode) {
          print('Review  lng:${productReviewList.length}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
        print('Error : $stackTrace');
      }
    });
  }

  addWishListCTR(String pId) async {
    print('add wish api ');
    isLoadingAddWishData.value = false;
    var wishes = await NavWishListRepo().addWishListRepo(pId);

    var bodyMap = json.decode(wishes.body);
    print('bodyMap Wish  $bodyMap');

    if (bodyMap['status'] == "success") {
      isLoadingAddWishData.value = true;
      wishMsg.value='Product has added to wishlist';
      Get.snackbar(
       'Alert ',
        wishMsg.value,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }else{
      wishMsg.value=bodyMap['wishlist_info'][0]['error'];
      isLoadingAddWishData.value = false;
      Get.snackbar(
        'Alert ',
        wishMsg.value,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
    wishCTR.reloadFun();
  }

}
