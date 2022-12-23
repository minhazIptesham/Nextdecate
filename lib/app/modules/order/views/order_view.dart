import 'package:flutter/material.dart';

import 'package:gameleven/app/global_widgets/empty_data_widget.dart';
import 'package:gameleven/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../data/utiles/ShimmerLoading.dart';
import '../../../global_widgets/order_item_card_widget.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('OrderList'.tr,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Get.offNamed(Routes.BOTTOMNAVIGATIONBAR);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
              ),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoadingGetOrderData.value) {
          if (controller.orderInfo.isEmpty) {
            return EmptyDataWidget('NoOrder'.tr);
          }
          else {

            return ListView.builder(
                itemCount: controller.orderInfo.length,
                itemBuilder: (context, index) {
                  return OrderItemCardWidget(controller.orderInfo[index],controller);
                });
          }
        } else {
          return ShimmerLoading().buildShimmerReview();
          //
        }
      }),
    );
  }
}
