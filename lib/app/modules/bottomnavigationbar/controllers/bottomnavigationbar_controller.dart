import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gameleven/app/data/models/brand_model.dart';
import 'package:gameleven/app/data/models/hot_categories_model.dart';
import 'package:gameleven/app/data/models/main_categories_model.dart';
import 'package:gameleven/app/data/models/product_card_model.dart';
import 'package:gameleven/app/data/models/shipping_method_amount_model.dart';
import 'package:gameleven/app/data/models/sub_category_model.dart';
import 'package:gameleven/app/data/models/user_profile_model.dart';
import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/views/nav_cart_screen.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/views/nav_categories_screen.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/views/nav_home_screen.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/views/nav_settings_screen.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/views/nav_wishlist_screen.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product_details_model.dart';
import '../../../data/models/slider_model.dart';
import '../../../data/models/wishlist_model.dart';
import '../../../data/repositories/checkout_repo.dart';
import '../../../data/repositories/nav_account_settings_reposities.dart';
import '../../../data/repositories/nav_categories_reposities.dart';
import '../../../data/repositories/nav_home_reposities.dart';
import '../../../data/repositories/nav_wishlist_reposities.dart';
import '../../../data/repositories/product_details_reposities.dart';

import '../../../data/models/new_productinfo_model.dart';
import '../../../data/models/product_cart_model.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';

class BottomNavigationbarController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tapController;
  //late TabController tapController1;

  var sliderList = [].obs;
  var homeBaseSaleList = [].obs;
  var homeAllProductList = [].obs;
  var brandList = [].obs;
  var profileInfo = [].obs;
  var categories = [].obs;
  var hotCategories = [].obs;
  var subCategories = [].obs;
  final wishlist = [].obs;
  final productInfoWithQty = <ProductCart>[].obs;

  var productDetailsInfo = ProductDetailsModel().obs;
  final isLoadingDataAmountAddressApi = false.obs;
  final count = 1.obs;
  var index = 2.obs;
  final totalAmount = 0.obs;
  final sum = 0.obs;
  final wishId = ''.obs;
  final categoryById = ''.obs;
  final shippingCost = 1.obs;

  final isLoadingData = false.obs;
  final isLoadingGetWishData = false.obs;
  final isLoadingAddWishData = false.obs;
  final isLoadingRemoveWishData = false.obs;
  final isSelectItems = false.obs;
  var isSelectCategoryStatus = false.obs;
  final isCategoryActive = false.obs;
  var addressMethodInfo = [].obs;

  final isLoadingSubCategoriesData=false.obs;

  List<String> sliderImageHolders = [
    "assets/gameleven1.png",
    "assets/gameleven1.png",
  ].obs;

  @override
  void onInit() async {
    screens;
   /* homeSliderCTR();
    homeBestSaleCTR();
    homeHotCategoriesCTR();
    homeAllProductsCTR();*/
    await homeMainCategoriesCTR();
    if (categories.isNotEmpty) {
      tapController = TabController(vsync: this, length: categories.length);
    }

    /// sub category

    homeBrandCTR();
    //getWishListCTR();
    productInfoWithQty.assignAll(DBHelper.object.getTheCartList());
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

  onChangedTab(var inx) {
    index.value = inx;
  }

  final screens = <Widget>[
    const NavCategoriesScreen(),
    const NavWishListScreen(),
    const NavHomeScreen(),
    NavCartScreen(),
    const NavSettingsScreen(),
  ];

  ///--------------- Categories  Screen Controller Method------------------

  ///--------------- WishList  Screen Controller Method------------------

  ///--------------- Home  Screen Controller Method------------------

  ///sub category list
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

  homeMainCategoriesCTR() async {
    categories.clear();
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
  }

  ///sub category
  homeSubCategoriesCTR(categoryId) async {
    isLoadingSubCategoriesData(false);
    subCategories.clear();
    var categoriesResponseValue = await NavHomeRepo()
        .homeSubCategoriesRepo(categoryId)
        .onError((error, stackTrace) {
      if (kDebugMode) {
        isLoadingSubCategoriesData(true);
        print('Hot Categories Error  : $error');
        print('Hot Categories Error : $stackTrace');
      }
    });
    var bodyMap = json.decode(categoriesResponseValue.body);

    if (bodyMap['catgories'] != null) {
      for (var categories in bodyMap['catgories']) {
        subCategories.add(SubCategoryModel.fromJson(categories));
      }
      if (kDebugMode) {
        print('Sub  Categories lng:${subCategories.length}');
        isLoadingSubCategoriesData(true);
      }
      isLoadingSubCategoriesData(true);
    }
    isLoadingSubCategoriesData(true);
  }

  homeHotCategoriesCTR() async {
    var categoriesResponseValue = await NavHomeRepo()
        .homeHotCategoriesRepo()
        .onError((error, stackTrace) {
      if (kDebugMode) {
        print('Hot Categories Error  : $error');
        print('Hot Categories Error : $stackTrace');
      }
    });
    var bodyMap = json.decode(categoriesResponseValue.body);

    if (bodyMap['hot_categories'] != null) {
      for (var categories in bodyMap['hot_categories']) {
        hotCategories.add(HotCategoriesModel.fromJson(categories));
      }
      if (kDebugMode) {
        print('Hot Categories lng:${hotCategories.length}');
      }
    }
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

  ///--------------- Cart  Screen Controller Method------------------

  double get totalPrice => productInfoWithQty.fold(
      0,
      (sum, price) => sum = sum +
          double.parse(price.productInfo!.cartItemProductPrice.toString()) *
              double.parse(
                  price.productInfo!.cartItemProductQuantity.toString()));

  addToCart(NewProductModel products) {
    print('Product Id >> ${products.cartItemProductId}');

    for (var i = 0; i < productInfoWithQty.length; i++) {
      ProductCart temp = productInfoWithQty[i];
      if (temp.productInfo!.cartItemProductId == products.cartItemProductId) {
        // productInfoWithQty[i].productQty++;
        productInfoWithQty[i].productInfo!.cartItemProductQuantity++;
        // save the cart list to database
        DBHelper.object.updateCartList(productInfoWithQty);
        return;
      }
    }

    ProductCart itemCart = ProductCart(products, 1, false);
    productInfoWithQty.add(itemCart);
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  removeFromCart(int index) {
    productInfoWithQty.removeAt(index);
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
    update();
  }

  removeAllCart() {
    productInfoWithQty.clear();
    count.value = count.value++;
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  addToCartQtyIncrement(int index) {
    print('Inc Method ');

    //  productInfoWithQty[index].productQty++;
    productInfoWithQty[index].productInfo!.cartItemProductQuantity++;
    productInfoWithQty.refresh();
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  addToCartQtyDecrement(int index) {
    print('dec ');
    // productInfoWithQty[index].productQty--;
    productInfoWithQty[index].productInfo!.cartItemProductQuantity--;
    // save the cart list to database
    productInfoWithQty.refresh();
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  singleCardItemSelect(bool isSelect, index) {
    print('Single Select Item  ');
    productInfoWithQty[index].isCheckProductCart = isSelect;
    // save the cart list to database
    productInfoWithQty.refresh();
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  allCardItemSelect(bool value) {
    print('All Select Item  ');
    isSelectItems.value = value;
    if (productInfoWithQty.isNotEmpty) {
      if (value) {
        for (int i = 0; i < productInfoWithQty.length; i++) {
          productInfoWithQty[i].isCheckProductCart = true;
        }
      } else {
        for (int i = 0; i < productInfoWithQty.length; i++) {
          productInfoWithQty[i].isCheckProductCart = false;
        }
      }
    }

    // save the cart list to database
    productInfoWithQty.refresh();
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  ///--------------- Settings  Screen Controller Method------------------

  /// ------------------ Wish List ------------------------

  /// get Wish List CRL

  ///pending work
  void getWishName(int wishById) {
    WishListModel value = wishlist
        .where((c) => productDetailsCTR(c.wishlistId.toString()))
        .toList()
        .first;
    // wishIdCovertByName.value = value;
    print('wish id >> ${value.wishlistId}');
    //productDetailsCTR(value.wishlistId.toString());
    // return value;
  }

  productDetailsCTR(String wishId) {
    isLoadingData.value = false;
    ProductDetailsInfoRepo()
        .productDetailsBYIdRepo(wishId)
        .then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      if (bodyMap == null) {
        Get.back();
      }
      if (bodyMap['product_info'] != null) {
        productDetailsInfo.value =
            ProductDetailsModel.fromJson(bodyMap['product_info']);
        isLoadingData.value = true;
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

  getWishListCTR() async {
    print('get WishList  Api Call >>> ');

    isLoadingGetWishData.value = false;
    if (user_id.$!= "") {
      var getWish = await NavWishListRepo().getWishListRepo();
      var bodyMap = json.decode(getWish.body);

      if (bodyMap['status'] == "success") {
        if (bodyMap['wishlist_info'] != null) {
          for (var wishData in bodyMap['wishlist_info']) {
            wishlist.add(WishListModel.fromJson(wishData));
          }
          isLoadingGetWishData.value = true;
        }
      }
      print('wishList Lng : ${wishlist.length}');
    } else {
      print('UnAuthentication');
    }
  }


  shippingMethodAddressAmount() async {
    print('get Shipping  Method Amount  Api Call >>> ');
    isLoadingDataAmountAddressApi.value = false;
    var shippingMethodResponse = await CheckOutRepo().shippingMethodAddressRepo();

    var bodyMap = json.decode(shippingMethodResponse.body);
    print('Shipping Method >>>');
    print(bodyMap);
    for(var data in bodyMap['deleviry_info']){
      addressMethodInfo.add( ShippingMethodAmountModel.fromJson(data));
    }
    isLoadingDataAmountAddressApi(true);
    //}
  }

  /// Remove Wish List CRL
  removeWishListCTR() async {
    print('get Order Api Call >>> ');
    isLoadingRemoveWishData.value = false;
    var orders =
        await NavWishListRepo().removeWishListRepo(wishId.value.toString());
    var bodyMap = json.decode(orders.body);
    print('bodyMap Wish Remove  $bodyMap');
    if (bodyMap['status'] == "success") {
      isLoadingRemoveWishData.value = true;
    }
  }
}
