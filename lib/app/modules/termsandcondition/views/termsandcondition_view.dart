import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../data/models/terms_condition_model.dart';
import '../../../data/utiles/api_url.dart';
import '../../../global_widgets/CustomCircularIndicatorWiedget.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../init_first_controller/init_first_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/termsandcondition_controller.dart';

class TermsandconditionView extends GetView<TermsandconditionController> {
  const TermsandconditionView({Key? key}) : super(key: key);
  @override
  /* Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Condition'),
        centerTitle: true,
      ),
      body:  Obx(() => controller.isLoadedTermsInfo.value
          ? CustomCircularIndicatorWiedget(heightMulti: Get.height * 0.99)
          : ListView.builder(
          shrinkWrap: true,
          //  physics: NeverScrollableScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.termsConditionList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      controller.termsConditionList[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  termsListSubView(
                      controller.termsConditionList[index].subTitles),
                ],
              ),
            );
          })),
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
                homeNav.webSettingInfo.value.termsCondition!.image == null
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
                        '${ApiURL.globalUrl}${homeNav.webSettingInfo.value.termsCondition!.image.toString()}',
                        fit: BoxFit.fill,
                      ),
                SizedBox(
                  height: 10,
                ),
                homeNav.webSettingInfo.value.termsCondition!.details == null
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
                                '${homeNav.webSettingInfo.value.termsCondition!.details.toString()}'))
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

  /* termsListSubView(List<StuTitleModel> subList) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: subList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.only(left: 10),
            child: Text(subList[index].subTitle.toString(),
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
          );
        });
  }*/
}
