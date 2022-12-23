import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/slash_controller.dart';

class SlashView extends GetView<SlashController> {
  const SlashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SlashView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SlashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
