import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/brand_model.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';

import 'package:get/get.dart';

import '../../../data/utiles/api_url.dart';
import '../../../global_widgets/empty_data_widget.dart';
import '../../../init_first_controller/init_first_controller.dart';
import '../../../routes/app_pages.dart';
import '../../bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../controllers/brands_controller.dart';

class BrandsView extends GetView<BrandsController> {
  const BrandsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              if(controller.isHzView.value){
                controller.isHzView.value=false;
              }else{
                controller.isHzView.value=true;
              }

            },
            child:
            Obx((){
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child:controller.isHzView.value? Icon(Icons.view_comfy_alt,size: 20,):Icon(Icons. view_agenda_rounded,size: 20,),
              );
            })

          )],
        title:  Text('BrandList'.tr,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body:
      Obx((){
        return   controller.isHzView.value? brands(context): brandsHZ(context);
      })
      //brands(context),
    );
  }

  brands(BuildContext context) {
    return GetX<InitFirstController>(
        builder: (initController) {

          if(initController.brandList.isEmpty){
            return  EmptyDataWidget('BrandNotFound'.tr);
          }
          return  GridView.builder(
              physics: ScrollPhysics(),
              itemCount: initController.brandList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                 ),
              itemBuilder: (BuildContext ctx,int idx){
                BrandModel brandInfo=initController.brandList[idx];
                return  InkWell(
                  onTap: (){
                    /// Click Brand
                    initController.brandWiseProductId.value=brandInfo.brandId.toString();
                    initController.homeBrandWiseProductCTR();
                    Get.toNamed(Routes.BRANDWISE_PRODUCT);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(left: 2, right: 2),

                        height: 80,
                        child: Image.network(
                          '${ApiURL.globalUrl}${brandInfo.brandImage}',fit: BoxFit.cover,),
                      ),

                      Container(
                        width:200,
                        decoration: BoxDecoration(
                            color: CtmColors.appColor,
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(right: 6, left: 8),
                        height: 30,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            brandInfo.brandName.toString(),
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      )

                    ],
                  ),
                );

              });
        }
    );
  }

  brandsHZ(BuildContext context) {
    var bottomNavCTR = Get.put(BottomNavigationbarController());
    return GetX<InitFirstController>(
        builder: (initController) {

          if(initController.brandList.isEmpty){
            return  EmptyDataWidget('BrandNotFound'.tr);
          }

          return ListView.builder(
              scrollDirection:  Axis.vertical,
              itemCount: initController.brandList.length,
              itemBuilder: (BuildContext context, int index){
                BrandModel brandInfo=initController.brandList[index];
                return InkWell(
                    onTap: (){
                      /// Click Brand
                      initController.brandWiseProductId.value=brandInfo.brandId.toString();
                       initController.homeBrandWiseProductCTR();
                      Get.toNamed(Routes.BRANDWISE_PRODUCT);
                    },
                  child:  Container(
                    margin: EdgeInsets.symmetric(vertical: 3,horizontal:3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(

                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.blue,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network('${ApiURL.globalUrl}${brandInfo.brandImage}', fit: BoxFit.fill,),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  width:200,
                                  decoration: BoxDecoration(
                                      color: CtmColors.appColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: EdgeInsets.only(right: 6, left: 8),
                                  height: 30,

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      brandInfo.brandName.toString(),
                                      textAlign: TextAlign.center,
                                      style:
                                      TextStyle(fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
    );
  }
}
