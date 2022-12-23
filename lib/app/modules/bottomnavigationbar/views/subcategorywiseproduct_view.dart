import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/product_widget.dart';
import '../controllers/bottomnavigationbar_controller.dart';

class SubcategorywiseproductView extends GetView {

  BottomNavigationbarController controller;


  SubcategorywiseproductView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('SubCategoryWiseProducts'.tr),
        centerTitle: true,
      ),
      body: ProductListWidget(productList: controller.homeBaseSaleList),
    );
  }
}
