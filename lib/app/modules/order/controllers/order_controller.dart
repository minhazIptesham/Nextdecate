import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/order_details_model.dart';
import 'package:gameleven/app/data/models/order_model.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../data/repositories/order_reposities.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';

enum OrderStatus { ALL, PENDING, DELIVERED, CANCEL }

class OrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement OrderController
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final count = 0.obs;
  final isLoadingGetOrderData = false.obs;

  final GlobalKey<FormState> reviewGlobalKey = GlobalKey<FormState>();
  var reviewController = TextEditingController();

  var orderInfo = [].obs;

  final orderId = ''.obs;
  final productId = ''.obs;
  final rating = 3.obs;

  final isLoadingGetOrderDetailsData = false.obs;
  var orderDetailsInfo = [].obs;

  late TabController tapController;
  @override
  void onInit() {
    getOrderInfo();
    tapController = TabController(vsync: this, length: getList.length);
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
  List<Demo> getList = [
    Demo('01', "ALL", 'des1'),
    Demo('02', "PENDING", 'des2'),
    Demo('03', "DELIVERED", 'des3'),
    Demo('04', "CANCEL", 'des4'),
  ];

  getOrderList() {
    return Text('');
  }

  getOrderInfo() async {
    print('get Order Api Call >>> ');
    isLoadingGetOrderData.value = false;
    var orders = await OrderRepo().getOrderListRepo();

    var bodyMap = json.decode(orders.body);
    print('bodyMap Order name ${bodyMap['order_info'][0]['order_id']}');
    print(bodyMap['status']);
    if (bodyMap['success'] == "success") {
      if (bodyMap['order_info'] != null) {
        for (var data in bodyMap['order_info']) {
          print('data${data}');
          orderInfo.add(OrderModel.fromJson(data));
        }
        isLoadingGetOrderData.value = true;
      }
      isLoadingGetOrderData.value = true;
    }
    isLoadingGetOrderData.value = true;
    print('Order Lng : ${isLoadingGetOrderData.value}');
    print('Order Lng : ${orderInfo.length}');
  }

  getOrderDetailsInfo(context) async {
    ProgressDialog pr= DBHelper.loadingDialog(context);
    pr.show();
    orderDetailsInfo.clear();
    isLoadingGetOrderDetailsData.value = false;
    var orders = await OrderRepo().getOrderDetailsListRepo(orderId.value);
    var bodyMap = json.decode(orders.body);
    if (bodyMap['status'] == "success") {
      if (bodyMap['order_details'] != null) {
        for (var data in bodyMap['order_details']) {
          orderDetailsInfo.add(OrderDetailsModel.fromJson(data));
        }
        pr.hide();
        isLoadingGetOrderDetailsData.value = true;
      }

      pr.hide();
      isLoadingGetOrderDetailsData.value = true;
    }
    pr.hide();
    isLoadingGetOrderDetailsData.value = true;
    print('Order Details  Lng : ${orderDetailsInfo.length}');
  }

  /// Review
  reviewProduct() async {
    var backDataResponse = await OrderRepo().createReviewRepo(
        productId.value, reviewController.text, rating.value.toString());
  }
}

class Demo {
  String demoId;
  String demoName;
  String demoDescription;

  Demo(this.demoId, this.demoName, this.demoDescription);
}
