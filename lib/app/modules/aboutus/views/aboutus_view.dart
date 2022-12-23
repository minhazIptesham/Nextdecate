import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../data/utiles/api_url.dart';
import '../../../data/utiles/app_strings.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../init_first_controller/init_first_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/aboutus_controller.dart';

class AboutusView extends GetView<AboutusController> {
  const AboutusView({Key? key}) : super(key: key);
  @override
/*  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body:    Text(''' 
              
            
                 Isshue Multistore E-Commerce system.
                
                      Address: New York, USA  
                      Mobile: +00-000-00000
                      Email: abc@gmail.com
                      Website: https://abc.com'''
        ,style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
    );
  }*/

  Widget build(BuildContext context) {
    var homeNav = Get.put(InitFirstController());
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBarWidget('Policy', isBackButton: true),
                homeNav.webSettingInfo.value.aboutUs!.image == null
                    ? Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                        height: 200,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                        ))
                  //Text(  '${productInfo.description.toString()}',style: TextStyle(fontWeight: FontWeight.w300),) ),
                )
                    : Image.network(
                  '${ApiURL.globalUrl}${homeNav.webSettingInfo.value.aboutUs!.image.toString()}',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10,
                ),
                homeNav.webSettingInfo.value.aboutUs!.details == null
                    ? Center(
                    child: const Text(
                      'No data',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ))
                    : Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: HtmlWidget(
                            '${homeNav.webSettingInfo.value.aboutUs!.details.toString()}'))
                  //Text(  '${productInfo.description.toString()}',style: TextStyle(fontWeight: FontWeight.w300),) ),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.toNamed(Routes.CONTACTUS);
          },
          child: Container(
            alignment: const Alignment(0.0, -0.08),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.green
              //   CtmColors.appColor

            ),
            child: const Text(
              'Contact Us ',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
