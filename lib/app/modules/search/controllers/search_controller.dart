import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gameleven/app/data/repositories/nav_home_reposities.dart';
import 'package:get/get.dart';

import '../../../data/models/product_card_model.dart';
import '../../../data/models/search_model.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  final isLoadingSearchData = false.obs;
  var searchProductList = [].obs;
  final searchValue =''.obs;

  TextEditingController searchField = TextEditingController();

  @override
  void onInit() {
    getSearchProductController();
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

//searchProductRepo
  getSearchProductController() async {
    searchProductList.clear();
    print('get  Product Search  Api Call >>>');
    isLoadingSearchData.value = false;
    var searchResponse = await NavHomeRepo().searchProductRepo(searchValue.value);

    var bodyMap = json.decode(searchResponse.body);
    if (bodyMap['status'] == "success") {
      for(var data in bodyMap['product_info']){
        searchProductList.add(SearchModel.fromJson(data));
      }


      if (kDebugMode) {
        print('search product  id:${bodyMap['product_info']}');
        print('lng :${searchProductList.length}');
      }
      isLoadingSearchData(true);
    }
  }

}
