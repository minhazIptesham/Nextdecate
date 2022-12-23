import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/utiles/app_colors.dart';
import '../../../routes/app_pages.dart';

class SuccessfulViewView extends GetView {
  const SuccessfulViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:   Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Center(
            child:  Text(
              'OrderHasBeenSuccessful'.tr,
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
            ),
          ),

          Image.asset(
            "assets/successful.gif",
            fit: BoxFit.cover,
          ),

          GestureDetector(
            onTap: () {
                Get.offAllNamed(Routes.ORDER);
            },
            child: Container(

              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green),
              child:   Center(
                  child: Text(
                    'OrderHistory'.tr,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ),

          GestureDetector(
            onTap: () {
                Get.offAllNamed(Routes.BOTTOMNAVIGATIONBAR);
            },
            child: Container(

              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF18042C)),
              child:   Center(
                  child: Text(
                    'Home'.tr,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ),


        ],
      ),
    );
  }
}
