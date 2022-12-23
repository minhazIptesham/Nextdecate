import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/empty_data_widget.dart';
import '../../../global_widgets/product_widget.dart';
import '../../../init_first_controller/init_first_controller.dart';
import '../controllers/brandwise_product_controller.dart';

class BrandwiseProductView extends GetView<BrandwiseProductController> {
  const BrandwiseProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title:  Text('BrandWiseProduct'.tr,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: brandWiseProductList(context)
    );
  }
  brandWiseProductList (BuildContext context) {
    return GetX<InitFirstController>(
        builder: (mainCategories) {

          if(mainCategories.homeBrandWiseProductList.isEmpty){
            return  EmptyDataWidget('productNotFound'.tr);
          }
          return   ProductListWidget(productList: mainCategories.homeBrandWiseProductList);

        }
    );
  }

}
