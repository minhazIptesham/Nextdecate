import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gameleven/app/init_first_controller/init_first_controller.dart';

import 'package:get/get.dart';

import '../../../data/models/new_productinfo_model.dart';
import '../../../data/models/product_card_model.dart';
import '../../../data/utiles/api_url.dart';
import '../../../global_widgets/empty_data_widget.dart';
import '../../bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../controllers/morevall_product_controller.dart';

class MorevallProductView extends GetView<MorevallProductController> {
  const MorevallProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
             child:  Obx((){
               return Padding(
                 padding: const EdgeInsets.all(12.0),
                 child:controller.isHzView.value? Icon(Icons.view_comfy_alt,size: 20,):Icon(Icons. view_agenda_rounded,size: 20,),
               );
             }),
           )],
        title:  Text('ProductList'.tr,style: TextStyle(color: Colors.white),),centerTitle: true,),
      body:
       Obx((){
        return   controller.isHzView.value? MoreAllProductHZ(context): MoreAllProduct(context);
       })

      //MoreAllProduct(context),
    );
  }

  MoreAllProduct(BuildContext context) {
    var bottomNavCTR = Get.put(BottomNavigationbarController());
    return GetX<InitFirstController>(
        builder: (controller) {

          if(controller.homeBaseSaleList.isEmpty){
            return  EmptyDataWidget('BrandNotFound'.tr);
          }

          return SingleChildScrollView(
              child:  Container(

                child: StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),

                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 6,
                  itemCount: controller.homeBaseSaleList.length,
                  itemBuilder: (context, index) {
                    ProductCardModel pInfo = controller.homeBaseSaleList[index];
                    return InkWell(
                      onTap: () async {
                      /*  productDetails.productId.value = pInfo.id!;
                        productDetails.productCategoryId.value = pInfo.catId!;
                        await productDetails.productDetailsCTR();
                        await productDetails.productDetailsRelatedCTR();
                        Get.toNamed(Routes.PRODUCT_DETAILS);*/
                      },
                      child:  Container(
                        margin: EdgeInsets.symmetric(vertical: 3,horizontal:3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 140,
                                  width: MediaQuery.of(context).size.width,
                                  //color: Colors.blue,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network('${ApiURL.globalUrl}${pInfo.imageThumb}', fit: BoxFit.fill,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  pInfo.name.toString(),

                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      ' ৳ ' + pInfo.price.toString(),
                                      style: const TextStyle(

                                        color: Color(0xFFD81D4C),
                                        fontWeight: FontWeight.w500,
                                        height: 1.42,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {

                                      if (int.parse(pInfo.stock.toString()) > 0) {
                                        var cartProduct = NewProductModel(
                                            cartProductName: pInfo.name,
                                            cartProductImage: pInfo.imageThumb,
                                            cartItemProductId:
                                            int.parse(pInfo.id.toString()),
                                            cartItemProductVariantId: 1,
                                            cartItemProductPrice:
                                            double.parse(pInfo.price.toString()),
                                            cartItemProductQuantity:
                                            1, // int.parse(qty.toString()),
                                            cartItemTotalPrice:
                                            double.parse(pInfo.price.toString()),
                                            cartItemDiscountPerProduct: '1',
                                            productStock: pInfo.stock.toString());

                                        bottomNavCTR.addToCart(cartProduct);
                                        Get.snackbar(
                                          'ItemHasBeenAdded'.tr,
                                          pInfo.name.toString(),
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white,
                                          duration: const Duration(seconds: 2),
                                        );
                                      } else {
                                        _stockAlert();
                                      }
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color:
                                          const Color.fromARGB(255, 231, 226, 226),
                                          borderRadius: BorderRadius.circular(12.5)),
                                      child: const Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 18,
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 0.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.red, size: 10),
                                    Icon(Icons.star, color: Colors.red, size: 10),
                                    Icon(Icons.star, color: Colors.red, size: 10),
                                    Icon(Icons.star, color: Colors.red, size: 10),
                                    Icon(Icons.star, color: Colors.red, size: 10),

                                    Text(
                                      '(${pInfo.rating.toString()})',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: const Color(0xFF868686),
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
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
                  },
                  staggeredTileBuilder: (int index)=>
                      StaggeredTile.count(3, index.isOdd? 4.0:3.6),
                  crossAxisSpacing:  3.0,
                  mainAxisSpacing:  2.0,


                ),
              )
          );
        }
    );
  }

  MoreAllProductHZ(BuildContext context) {
    var bottomNavCTR = Get.put(BottomNavigationbarController());
    return GetX<InitFirstController>(
        builder: (controller) {

          if(controller.homeBaseSaleList.isEmpty){
            return  EmptyDataWidget('BrandNotFound'.tr);
          }

          return ListView.builder(
              scrollDirection:  Axis.vertical,
              itemCount: controller.homeBaseSaleList.length,
              itemBuilder: (BuildContext context, int index){
                ProductCardModel pInfo = controller.homeBaseSaleList[index];
                return InkWell(
                  onTap: () async {
                    /*  productDetails.productId.value = pInfo.id!;
                          productDetails.productCategoryId.value = pInfo.catId!;
                          await productDetails.productDetailsCTR();
                          await productDetails.productDetailsRelatedCTR();
                          Get.toNamed(Routes.PRODUCT_DETAILS);*/
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
                                  child: Image.network('${ApiURL.globalUrl}${pInfo.imageThumb}', fit: BoxFit.fill,),
                                ),
                              ),
                            ),
                          ),
                         
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    pInfo.name.toString(),

                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        ' ৳ ' + pInfo.price.toString(),
                                        style: const TextStyle(

                                          color: Color(0xFFD81D4C),
                                          fontWeight: FontWeight.w500,
                                          height: 1.42,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {

                                        if (int.parse(pInfo.stock.toString()) > 0) {
                                          var cartProduct = NewProductModel(
                                              cartProductName: pInfo.name,
                                              cartProductImage: pInfo.imageThumb,
                                              cartItemProductId:
                                              int.parse(pInfo.id.toString()),
                                              cartItemProductVariantId: 1,
                                              cartItemProductPrice:
                                              double.parse(pInfo.price.toString()),
                                              cartItemProductQuantity:
                                              1, // int.parse(qty.toString()),
                                              cartItemTotalPrice:
                                              double.parse(pInfo.price.toString()),
                                              cartItemDiscountPerProduct: '1',
                                              productStock: pInfo.stock.toString());

                                          bottomNavCTR.addToCart(cartProduct);
                                          Get.snackbar(
                                            'ItemHasBeenAdded'.tr,
                                            pInfo.name.toString(),
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                            duration: const Duration(seconds: 2),
                                          );
                                        } else {
                                          _stockAlert();
                                        }
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color:
                                            const Color.fromARGB(255, 231, 226, 226),
                                            borderRadius: BorderRadius.circular(12.5)),
                                        child: const Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 18,
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0, right: 0.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.red, size: 10),
                                      Icon(Icons.star, color: Colors.red, size: 10),
                                      Icon(Icons.star, color: Colors.red, size: 10),
                                      Icon(Icons.star, color: Colors.red, size: 10),
                                      Icon(Icons.star, color: Colors.red, size: 10),

                                      Text(
                                        '(${pInfo.rating.toString()})',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: const Color(0xFF868686),
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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

  _stockAlert() {
    Get.dialog(
      AlertDialog(
        title:  Text('StockOut'.tr),
        content:  Text('productIsNotAvailable'.tr),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child:  Text('OK!'.tr),
          ),
        ],
      ),
    );
  }
}
