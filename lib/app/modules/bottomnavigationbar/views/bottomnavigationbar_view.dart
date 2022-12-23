import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/views/tabbar_widget.dart';

import 'package:get/get.dart';
import '../controllers/bottomnavigationbar_controller.dart';

class BottomnavigationbarView extends GetView<BottomNavigationbarController> {
  const BottomnavigationbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>openDialog(),
      child:

      Scaffold(
        body:  Obx(
              () => controller.screens[controller.index.value],
        ),
        bottomNavigationBar:
        Obx(() {
          return TabBarMaterialWidget(
            index2: controller.index.value,
            onChangedTab: controller.onChangedTab,
          );
        },),

      ),
    );
  }
  openDialog() {
    Get.dialog(
      AlertDialog(
        title:  Text('AreYorSure'.tr),
        content:  Text('DoYouWantToExitThisApp'.tr),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child:  Text('No'.tr),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                exit(0);
                print("android>>>>");
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child:  Text('Yes'.tr),
          ),
        ],
      ),
    );
  }

}
