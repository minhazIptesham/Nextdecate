import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/allproduct_controller.dart';

class AllproductView extends GetView<AllproductController> {
  const AllproductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllproductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AllproductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
