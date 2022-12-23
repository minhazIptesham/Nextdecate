import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/giftcard_controller.dart';

class GiftcardView extends GetView<GiftcardController> {
  const GiftcardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GiftcardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GiftcardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
