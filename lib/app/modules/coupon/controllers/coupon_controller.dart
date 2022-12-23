import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/models/coupon_model.dart';
import '../../../data/repositories/coupon_repositories.dart';

class CouponController extends GetxController {
  //TODO: Implement CouponController

  final count = 0.obs;

  final isLoadingCouponData = false.obs;
  var coupons = [].obs;
  @override
  void onInit() {
    couponListCTR();
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

  /// Coupon List Controller
  couponListCTR() async {
    isLoadingCouponData(false);
    coupons.clear();
    var categoriesResponseValue = await CouponRepo().getCouponListRepo()
        .onError((error, stackTrace) {
      if (kDebugMode) {
        isLoadingCouponData(true);
        print('coupon Error  : $error');
        print('coupon Error : $stackTrace');
      }
    });
    var bodyMap = json.decode(categoriesResponseValue.body);

    if (bodyMap['coupon_info'] != null) {
      for (var categories in bodyMap['coupon_info']) {
        coupons.add(CouponModel.fromJson(categories));
      }
      if (kDebugMode) {
        print('Coupons lng:${coupons.length}');
        isLoadingCouponData(true);
      }
      isLoadingCouponData(true);
    }
    isLoadingCouponData(true);
  }

  /// todo list 50%
  applyCouponCodeCTR() async {
    isLoadingCouponData(false);
    coupons.clear();
    var categoriesResponseValue = await CouponRepo().applyCouponCodeRepo('couponCode')
        .onError((error, stackTrace) {
      if (kDebugMode) {
        isLoadingCouponData(true);
        print('coupon Apply Error  : $error');
        print('coupon  Apply Error : $stackTrace');
      }
    });
    var bodyMap = json.decode(categoriesResponseValue.body);

    if (bodyMap['coupon_info'] != null) {
      for (var categories in bodyMap['coupon_info']) {
        coupons.add(CouponModel.fromJson(categories));
      }
      if (kDebugMode) {
        print('Coupons  lng:${coupons.length}');
        isLoadingCouponData(true);
      }
      isLoadingCouponData(true);
    }
    isLoadingCouponData(true);
  }

  void increment() => count.value++;
}
