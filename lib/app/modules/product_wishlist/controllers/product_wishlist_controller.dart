import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gameleven/app/data/models/wishlist_model.dart';
import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';
import 'package:get/get.dart';

import '../../../data/models/product_details_model.dart';
import '../../../data/repositories/nav_wishlist_reposities.dart';
import '../../../data/repositories/product_details_reposities.dart';

class ProductWishlistController extends GetxController {
  //TODO: Implement ProductWishlistController

  final count = 0.obs;

  final isLoadingGetWishData = false.obs;
  final isLoadingAddWishData = false.obs;
  final isLoadingRemoveWishData = false.obs;
 final wishlist =[].obs;
  var productDetailsInfo= ProductDetailsModel().obs;
 final wishIdCovertByName=''.obs;

  @override
  void onInit()async {
    print('onInit');
   await reloadFun();
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

  void increment() => count.value++;

  getWishListCTR() async {

    wishlist.clear();
    print('get WishList  Api Call >>> ');

    isLoadingGetWishData.value = false;
    if(user_id.$!=""){
      var getWish = await NavWishListRepo().getWishListRepo();
      var bodyMap = json.decode(getWish.body);
      print('bodyMap Wish $bodyMap');
      if (bodyMap['status'] == "success") {
        if (bodyMap['wishlist_info'] != null) {
          for (var wishData in bodyMap['wishlist_info']) {
            wishlist.add(WishListModel.fromJson(wishData));
          }
          isLoadingGetWishData.value = true;
        }
        isLoadingGetWishData.value = true;
      }
      print('wishList Lng : ${wishlist.length}');
    }else{
      isLoadingGetWishData.value = true;
      print('UnAuthentication');
    }
  }

  removeWishListCTR(String wishId) async {
    print('WishId >>${wishId.toString()}');
    print('get Order Api Call >>> ');
    isLoadingRemoveWishData.value = false;
    var orders = await NavWishListRepo().removeWishListRepo(wishId);
    var bodyMap = json.decode(orders.body);
    print('bodyMap Wish Remove  $bodyMap');
    if (bodyMap['status'] == "success") {
      isLoadingRemoveWishData.value = true;

      getWishListCTR();
    }
  }

 Future <void> reloadFun()async{
      await getWishListCTR();
  }
}
