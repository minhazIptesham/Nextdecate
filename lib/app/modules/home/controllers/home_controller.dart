import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  final GlobalKey<ScaffoldState> globalKey1 = GlobalKey<ScaffoldState>();
  final count = 0.obs;


  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController tapController;

  @override
  void onInit() {
    super.onInit();
    tapController = TabController(vsync: this, length: 5);
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
}
