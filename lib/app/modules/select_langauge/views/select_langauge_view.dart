import 'package:flutter/material.dart';
import 'package:gameleven/app/global_widgets/spaceH15.dart';


import 'package:get/get.dart';

import '../controllers/select_langauge_controller.dart';

class SelectLangaugeView extends GetView<SelectLangaugeController> {
  const SelectLangaugeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Language ',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body:

         Obx((){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 const Icon(Icons.language_outlined,size: 100,),
                 const SpaceH15(),
                  Text ('Select your Language'.tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                 const SpaceH15(),
                 Container(
                   margin: const EdgeInsets.symmetric(vertical: 5),
                   height: 60,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey, width: 1),
                     // color: Colors.grey
                   ),
                   child: ListTile(
                     leading:   Image.asset(
                       "assets/language_flag/us_en.png",
                       height: 60,
                       width: 60,

                     ),
                     title: const Text('English'),
                     trailing: Radio(
                         value: 0,
                         groupValue: controller.isSelectLanguage.value,
                         //controller.selectPaymentMethodById.value,
                         onChanged: (int? val) {
                           print('outside $val');
                           controller.isSelectLanguage.value = val!;
                           print(controller.isSelectLanguage.value);
                           controller.selectLanguageTr('en');
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Language has selected  !')));
                         }),
                   ),
                 ),
                 Container(
                   margin: const EdgeInsets.symmetric(vertical: 5),
                   height: 60,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey, width: 1),
                     // color: Colors.grey
                   ),
                   child: ListTile(
                     leading: Image.asset(
                       "assets/language_flag/bn_bd.png",
                       height: 60,
                       width: 60,

                     ),
                     title: const Text('বাংলা'),
                     trailing: Radio(
                         value: 1,
                         groupValue: controller.isSelectLanguage.value,
                         onChanged: (int? val) {
                           print('outside $val');
                           controller.isSelectLanguage.value = val!;
                           print(controller.isSelectLanguage.value);
                           controller.selectLanguageTr('bn');
                           /* Locale loc= Locale('bn');
                           Get.updateLocale(loc);*/
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Language has selected  !')));
                         }),
                   ),
                 ),
               ],
             ),
           );
         })

    );
  }
}
