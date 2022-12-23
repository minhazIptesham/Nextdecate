import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gameleven/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/utiles/api_url.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../init_first_controller/init_first_controller.dart';
import '../controllers/policy_controller.dart';

class PolicyView extends GetView<PolicyController> {
  const PolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homeNav = Get.put(InitFirstController());
    return SafeArea(
      child: Scaffold(

        body: Obx((){
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBarWidget('Policy'.tr,isBackButton: true),

                  homeNav.webSettingInfo.value.privacyPolicy!.image==null?
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(

                          height: 200,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child:Icon(Icons.image_not_supported_outlined,size: 50,))
                    //Text(  '${productInfo.description.toString()}',style: TextStyle(fontWeight: FontWeight.w300),) ),
                  ):
                  Image.network(
                    '${ApiURL.globalUrl}${homeNav.webSettingInfo.value.privacyPolicy!.image.toString()}',
                    fit: BoxFit.fill,
                  ),


                  SizedBox(height: 10,),

                  homeNav.webSettingInfo.value.privacyPolicy!.details==null?Center(child: const Text('No data',style: TextStyle(fontSize: 18,color: Colors.black),))
                 :
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child:HtmlWidget('${homeNav.webSettingInfo.value.privacyPolicy!.details.toString()}'))
                    //Text(  '${productInfo.description.toString()}',style: TextStyle(fontWeight: FontWeight.w300),) ),
                  ),

                ],
              ),
            );
        }) ,
        bottomNavigationBar:InkWell(
          onTap: (){

            Get.toNamed(Routes.CONTACTUS);
          },
          child: Container(
            alignment: const Alignment(0.0, -0.08),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.green
              //   CtmColors.appColor

            ),
            child:  Text(
              'ContactUs'.tr,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}