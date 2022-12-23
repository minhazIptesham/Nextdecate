import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/brand_model.dart';
import '../data/models/main_categories_model.dart';
import '../data/models/product_card_model.dart';
import '../data/models/slider_model.dart';
import '../data/models/sub_category_model.dart';
import '../data/models/websettings_model.dart';
import '../data/repositories/PolicyTermsRepo.dart';
import '../data/repositories/nav_categories_reposities.dart';
import '../data/repositories/nav_home_reposities.dart';


class InitFirstController extends GetxController  with GetTickerProviderStateMixin {
  late TabController tapController;
  List<String> sliderImageHolders = [
    "assets/gameleven1.png",
    "assets/gameleven1.png",
  ].obs;
  final tapCount = 1.obs;
  var categories = [].obs;
  final categoryById = ''.obs;

  var sliderList = [].obs;
  var homeBaseSaleList = [].obs;
  var homeBrandWiseProductList = [].obs;
  var homeAllProductList = [].obs;
  var brandList = [].obs;
  var brandWiseProductId = ''.obs;

  var profileInfo = [].obs;
  var hotCategories = [].obs;
  var subCategories = [].obs;
  final wishlist = [].obs;
  final isLoadingData = false.obs;
  final isLoadingGetWishData = false.obs;
  final isLoadingAddWishData = false.obs;
  final isLoadingRemoveWishData = false.obs;
  final isSelectItems = false.obs;
  var isSelectCategoryStatus = false.obs;
  final isCategoryActive = false.obs;
  var webSettingInfo= WebSettingsModel().obs;

  @override
  void onInit() async {
    await homeMainCategoriesCTR();
    if (categories.isNotEmpty) {
      tapController = TabController(vsync: this, length: categories.length);
    }
    await _firstCallMethod();
    homeAllProductsCTR();
    webInfo();
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


  _firstCallMethod(){
    homeSliderCTR();
    homeBestSaleCTR();
    homeBrandCTR();

  }


  homeSubCategoriesCTR1() async {
    isLoadingData(false);
    subCategories.clear();
    var categoriesResponseValue = await NavHomeRepo()
        .homeSubCategoriesRepo(categoryById.value)
        .onError((error, stackTrace) {
      if (kDebugMode) {
        print('Sub Categories Error : $stackTrace');
      }
    });
    var bodyMap = json.decode(categoriesResponseValue.body);

    if (bodyMap['catgories'] != null) {
      for (var categories in bodyMap['catgories']) {
        subCategories.add(SubCategoryModel.fromJson(categories));
      }
      if (kDebugMode) {
        print('Sub  Categories lng:${subCategories.length}');
      }

    }
    isLoadingData(true);
  }

  homeSliderCTR() {
    NavHomeRepo().sliderRepo().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      if (bodyMap['slider_info'] != null) {
        for (var images in bodyMap['slider_info']) {
          sliderList.add(SliderModel.fromJson(images));
        }
        if (kDebugMode) {
          print('sliders lng:${sliderList.length}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
        print('Error : $stackTrace');
      }
    });
  }

  homeBestSaleCTR() {
    NavHomeRepo().homeBestSaleRepo().then((resValue) async {
      var bodyMap = resValue;
      if (bodyMap['product_info'] != null) {
        for (var products in bodyMap['product_info']) {
          homeBaseSaleList.add(ProductCardModel.fromJson(products));
        }
        if (kDebugMode) {
          print('Best Sale lng:${homeBaseSaleList.length}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
        print('Error : $stackTrace');
      }
    });
  }

  homeAllProductsCTR() {
    NavHomeRepo().homeAllProductRepo().then((resValue) async {
      var bodyMap = resValue;
      if (bodyMap['product_info'] != null) {
        for (var products in bodyMap['product_info']) {
          homeAllProductList.add(ProductCardModel.fromJson(products));
        }
        if (kDebugMode) {
          print('All Product List  lng:${homeAllProductList.length}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('All Product Error : $error');
        print('All Product Error : $stackTrace');
      }
    });
  }

  homeBrandCTR() {
    NavHomeRepo().homeBrandListRepo().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      if (bodyMap['brand_list'] != null) {
        for (var brands in bodyMap['brand_list']) {
          brandList.add(BrandModel.fromJson(brands));
        }
        if (kDebugMode) {
          print('Brand List lng:${brandList.length}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Brand Error : $error');
        print('Brand Error : $stackTrace');
      }
    });
  }

  homeBrandWiseProductCTR() {

    homeBrandWiseProductList.clear();
    NavHomeRepo().homeBrandWiseProductRepo(brandWiseProductId.value).then((resValue) async {
      var bodyMap = resValue;
      if(bodyMap['status']=='error'){

      }else{
        if (bodyMap['product_info'] != null) {
          for (var products in bodyMap['product_info']) {
            homeBrandWiseProductList.add(ProductCardModel.fromJson(products));
          }
          if (kDebugMode) {
            print('brand wise product  lng:${homeBrandWiseProductList.length}');
          }
        }
      }

    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
        print('Error : $stackTrace');
      }
    });
  }

  homeMainCategoriesCTR() async {
    categories.clear();


    if (await checkInternetConnection()) {
      var categoriesResponseValue = await NavCategoriesRepo()
          .mainCategoriesRepo()
          .onError((error, stackTrace) {
        if (kDebugMode) {
          print('Categories Error  : $error');
          print('Categories Error : $stackTrace');
        }
      });
      var bodyMap = json.decode(categoriesResponseValue.body);

      if (bodyMap['category_info'] != null) {
        for (var catProducts in bodyMap['category_info']) {
          categories.add(MainCategoriesModel.fromJson(catProducts));
        }
        if (kDebugMode) {
          print('Categories lng:${categories.length}');
        }
      }
    }else{
       Get.defaultDialog(
           title: ' Internet Alert  ',
          middleText: 'Internet is not connection! \n Try again!'
          ,onCancel: (){
            Get.back();
       }
       );
    }
  }

  webInfo() {
    PolicyTermsRepo().webSettingInfo().then((resValue) async {
      var bodyMap = jsonDecode(resValue);
      if(bodyMap['status']=='error'){
        print(bodyMap['status']);
      }else{

        webSettingInfo.value= WebSettingsModel.fromJson(bodyMap['website_info']);
    //    if (bodyMap['website_info'] != null) {
          print('${bodyMap['website_info']['about_us']['headlines']}');
          print('${bodyMap['website_info']['terms_condition']}');
          print('${bodyMap['website_info']['privacy_policy']}');
          /* for (var products in bodyMap['website_info']) {
            homeBrandWiseProductList.add(ProductCardModel.fromJson(products));
          }*/
          if (kDebugMode) {
            print('web settings ');
          }
      //  }
      }

    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
        print('Error : $stackTrace');
      }
    });
  }

  Future<bool> checkInternetConnection() async {
    final connectivity.ConnectivityResult connectivityResult =
    await connectivity.Connectivity().checkConnectivity();
    if (GetPlatform.isAndroid) {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    } else {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    }
  }

}
