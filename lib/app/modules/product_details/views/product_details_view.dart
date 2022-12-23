import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';


import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/models/new_productinfo_model.dart';
import '../../../data/models/product_details_model.dart';
import '../../../data/utiles/ShimmerLoading.dart';
import '../../../data/utiles/api_url.dart';
import '../../../data/utiles/app_colors.dart';
import '../../../data/utiles/local_helper/shared_value_helper.dart';
import '../../../global_widgets/add_to_cart.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/product_related_widget.dart';
import '../../../global_widgets/product_widget.dart';
import '../../../global_widgets/review_list_widget.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../../global_widgets/variant_color.dart';
import '../../../global_widgets/variant_size.dart';
import '../../../routes/app_pages.dart';
import '../../bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  ProductDetailsView({Key? key}) : super(key: key);
  final pDetailsCTR = Get.put(BottomNavigationbarController());
  dynamic price = 0.0;
  dynamic qty = 0.0;
  dynamic totalPrice = 0.0;
  int id = 0;


  @override
  Widget build(BuildContext context) {

    ProductDetailsModel productInfo = controller.productDetailsInfo.value;
    print('productInfo ${productInfo.name}');
    print('productInfo Init ${controller.productDetailsInfo}');
    print('description   ${controller.productDetailsInfo.value}');

    return SafeArea(
      child:
      Scaffold(
        backgroundColor: Colors.grey.shade200,
       // appBar: AppBar(title: const Text('Product Details'),),
 /*       appBar: AppBar(title: const Text('Product Details'),

          actions: const [
            *//* Padding(
               padding: EdgeInsets.all(8.0),
               child: Icon(Icons.add_shopping_cart,),
             ),
             Padding(
             padding: EdgeInsets.all(8.0),
             child: Icon(Icons.favorite_border,),
           ),*//*

         ],
        ),*/
        body: Obx(() {
          if (controller.isLoadingData.value == false) {
            return ShimmerLoading().buildShimmerProductDetails(context);
          } else {
             productInfo = controller.productDetailsInfo.value;
            return _buildProductDetail(context, productInfo);
          }
        }),
        bottomNavigationBar:
        Obx(() {

          if (controller.isLoadingData.value == false) {
            return ShimmerLoading().buildShimmerProductDetails(context);
            //const Center(child: CircularProgressIndicator());
          } else {
            productInfo = controller.productDetailsInfo.value;
            return bottomMyCartBuyNowBTN(context, productInfo);
          }

        })


      ),
    );

  }

  ///  product details Body
  _buildProductDetail(context, ProductDetailsModel productInfo) {
    
    return SingleChildScrollView(
      child: Column(
        children: [

          CustomAppBarWidget('ProductDetails'.tr,isBackButton: true),
          ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              detailsProductSliders(context, productInfo),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         ' ৳ ' + productInfo.price.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFD81D4C),
                            fontWeight: FontWeight.w500,
                            height: 1.43,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share, size: 22),
                        )
                      ],
                    ),
                  ),*/
                 /* Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      children:  [
                        Text(productInfo.price.toString(),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14.0,
                            color: Color(0xFFCBCBCB),
                            fontWeight: FontWeight.w500,
                            height: .5,
                          ),
                        ),
                        Text(
                          ' -46%',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF868686),
                            fontWeight: FontWeight.w500,
                            height: .5,
                          ),
                        )
                      ],
                    ),
                  ),*/



                  Container(
                    height: Get.width/2+20,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),

                    child:Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' ৳ ' + productInfo.price.toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFFD81D4C),
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Share.share('http://soft29.bdtask.com/nextdecade/', subject: 'Url Link ');
                              },
                              icon: Icon(Icons.share, size: 22),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Text(
                          productInfo.name.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w500,
                            height: 1.44,
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.red, size: 12),
                            Icon(Icons.star, color: Colors.red, size: 12),
                            Icon(Icons.star, color: Colors.red, size: 12),
                            Icon(Icons.star, color: Colors.red, size: 12),
                            Icon(Icons.star, color: Colors.red, size: 12),
                            Text(
                              '(${productInfo.productRating.toString()})',
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
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Text(
                              'Stock Status: ',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w500,
                                height: 1.44,
                              ),
                            ),
                          ),



                          Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 12.0),
                            child:

                            productInfo!.stock==0?
                            Text(
                              'Out Of Stock',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w500,
                                height: 1.44,
                              ),
                            ):Text(
                              productInfo!.stock.toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w500,
                                height: 1.44,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          const Padding(
                            padding:  EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Text(
                              'Category Name : ',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: const Color(0xFF333333),
                                fontWeight: FontWeight.w500,
                                height: 1.44,
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Text(
                              productInfo.categoryName.toString(),
                              style: const  TextStyle(
                                fontSize: 14.0,
                                color:  Color(0xFF333333),
                                fontWeight: FontWeight.w500,
                                height: 1.44,
                              ),
                            ),
                          )

                        ],
                      ),

                      Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Text(
                              'Brand Name : ',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: const Color(0xFF333333),
                                fontWeight: FontWeight.w500,
                                height: 1.44,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Text(
                              productInfo.brandName.toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: const Color(0xFF333333),
                                fontWeight: FontWeight.w500,
                                height: 1.44,
                              ),
                            ),
                          )

                        ],
                      ),
                      const SpaceH15(),
                    ],)
                  ),

                  /// Variant



                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ProductVariant'.tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: CtmColors.appColor,
                            //const Color(0xFF021E65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ],
                    ),
                  ),
                  
                  productVariantView(),


                 /* Container(
                    width: MediaQuery.of(context).size.width,
                    height: 105.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 92.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.79, -0.41),
                              end: Alignment(-0.88, 0.12),
                              colors: [
                                const Color(0xFFA30D69),
                                const Color(0xFFD81D4C)
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 55,
                                      child: SvgPicture.string(
                                        // Path 195
                                        '<svg viewBox="0.0 59.41 49.93 37.44" ><path transform="translate(0.0, 0.0)" d="M 45.2450065612793 96.85529327392578 L 4.680572509765625 96.85529327392578 C 2.099594354629517 96.85529327392578 2.277413113915827e-05 94.75572204589844 2.277413113915827e-05 92.17475891113281 L 2.277413113915827e-05 84.37383270263672 C 2.277413113915827e-05 83.51144409179688 0.6978141665458679 82.81364440917969 1.560205936431885 82.81364440917969 C 4.141183853149414 82.81364440917969 6.240755081176758 80.71407318115234 6.240755081176758 78.13309478759766 C 6.240755081176758 75.5521240234375 4.141183853149414 73.45254516601562 1.560206055641174 73.45254516601562 C 0.6978143453598022 73.45265197753906 2.287430834257975e-05 72.75486755371094 2.287430834257975e-05 71.89247131347656 L 2.287430834257975e-05 64.09154510498047 C 2.287430834257975e-05 61.51057815551758 2.099594831466675 59.41100692749023 4.680572509765625 59.41100692749023 L 45.2451171875 59.41100692749023 C 47.82609939575195 59.41100692749023 49.9256706237793 61.51057815551758 49.9256706237793 64.09154510498047 L 49.9256706237793 71.89247131347656 C 49.9256706237793 72.75486755371094 49.22787475585938 73.45265197753906 48.36548614501953 73.45265197753906 C 45.78450775146484 73.45265197753906 43.6849365234375 75.55223083496094 43.6849365234375 78.13320922851562 C 43.6849365234375 80.71418762207031 45.78450775146484 82.81375122070312 48.36548614501953 82.81375122070312 C 49.22787475585938 82.81375122070312 49.9256706237793 83.51153564453125 49.9256706237793 84.37392425537109 L 49.9256706237793 92.17485046386719 C 49.92555999755859 94.75572204589844 47.82609176635742 96.85529327392578 45.2450065612793 96.85529327392578 Z M 3.120386362075806 85.77708435058594 L 3.120386362075806 92.17475891113281 C 3.120386362075806 93.03556060791016 3.819753408432007 93.73493194580078 4.680569171905518 93.73493194580078 L 45.24511337280273 93.73493194580078 C 46.10593414306641 93.73493194580078 46.8052978515625 93.03556060791016 46.8052978515625 92.17475891113281 L 46.8052978515625 85.77708435058594 C 43.24921798706055 85.05187225341797 40.5645637512207 81.90103912353516 40.5645637512207 78.13309478759766 C 40.5645637512207 74.36516571044922 43.24911117553711 71.21443176269531 46.8052978515625 70.48911285400391 L 46.8052978515625 64.09154510498047 C 46.8052978515625 63.23073196411133 46.10593414306641 62.53137588500977 45.24511337280273 62.53137588500977 L 4.680569171905518 62.53137588500977 C 3.819752931594849 62.53137588500977 3.120385885238647 63.23073196411133 3.120385885238647 64.09154510498047 L 3.120385885238647 70.48921966552734 C 6.676465034484863 71.21443176269531 9.361118316650391 74.36525726318359 9.361118316650391 78.13320922851562 C 9.361118316650391 81.90115356445312 6.676465034484863 85.05187225341797 3.120385885238647 85.77708435058594 Z" fill="#ffffff" fill-opacity="0.35" stroke="none" stroke-width="1" stroke-opacity="0.35" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        width: 30,
                                        height: 30,
                                        //fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'First Order Voucher',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '35% Off',
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            height: 1.2,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 113.0,
                                      height: 34.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        'COLLECT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: const Color(0xFF363636),
                                          fontWeight: FontWeight.w500,
                                          height: 1.88,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  //color: Colors.blue,
                                  height: 2,
                                  width: MediaQuery.of(context).size.width,
                                  child: SvgPicture.string(
                                    // Path 245
                                    '<svg viewBox="16.5 570.5 381.85 1.0" ><path transform="translate(16.5, 570.5)" d="M 0 0 L 381.8505554199219 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-dasharray="3 4" stroke-miterlimit="4" stroke-linecap="round" /></svg>',
                                    width: 381.85,
                                    height: 1.0,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Valid for 7 day(s) from collection',
                                      style: TextStyle(
                                        fontSize: 8.0,
                                        color: Colors.white,
                                        height: 2,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),*/

                /*  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 54.0,
                          color: const Color(0xFFD81D4C),
                          child: Text(
                            'Description',
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              //height: 1.88,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            //width: 414.0,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  offset: Offset(0, 3.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Text(
                              'Specifications',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: const Color(0xFF7B7B7B),
                                fontWeight: FontWeight.w500,
                                //height: 1.88,
                              ),
                            ),
                          ))
                    ],
                  ),*/

                  ///---------Description-----
                  ///


                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ProductDescription'.tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: CtmColors.appColor,
                            //const Color(0xFF021E65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SpaceH15(),

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(width: double.infinity,
                       // height: 100,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child:HtmlWidget('${productInfo.description.toString()}'))

                  ),

                 // productDescriptionSpecification(),

                 /* Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
                      child: Column(
                        children: [
                          Text(
                            productInfo.description.toString() ,
                            style: TextStyle(
                              fontSize: 16.0,
                              color:Colors.red,
                              fontWeight: FontWeight.w300,
                              height: 1.5,
                            ),
                          ),

                          Text(
                            '',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w300,
                              height: 1.5,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),*/
                  const SpaceH15(),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RelatedProducts'.tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: CtmColors.appColor,
                            //const Color(0xFF021E65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'ViewAll'.tr,
                          style: TextStyle(
                            fontSize: 13.0,
                            color:  CtmColors.appColor
                            //const Color(0xFF021E65),
                          ),
                        ),
                      ],
                    ),
                  ),

               //   _description(),
                  const SpaceH15(),
                  productListRelatedView(),

                  const SpaceH15(),
                  // Group: Group 338
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 255.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 12.0, bottom: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ReviewsRatings'.tr,
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                              CtmColors.appColor,
                              //const Color(0xFF021E65),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            //color: Colors.blue,
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '0',
                                            style: TextStyle(
                                              fontSize: 40.0,
                                              color:
                                              CtmColors.appColor,
                                              //const Color(0xFF021E65),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                            ],
                                          ),
                                          Text(
                                            '0',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color:
                                              CtmColors.appColor,
                                              //const Color(0xFF021E65),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        height: 100,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Text(
                                                ' 5(10)',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color:
                                                      const Color(0xFF868686),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Text(
                                                ' 4(5)',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color:
                                                      const Color(0xFF868686),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Text(
                                                ' 3(1)',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color:
                                                      const Color(0xFF868686),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Text(
                                                ' 2(1)',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color:
                                                      const Color(0xFF868686),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.red, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Icon(Icons.star,
                                                  color: Colors.grey, size: 15),
                                              Text(
                                                ' 1(1)',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color:
                                                      const Color(0xFF868686),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 0.0),


                          Center(
                            child: const Text(
                              'View all or write a review',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Color(0xFFD81D4C),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SpaceH15(),
                  _buildReviewList(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  detailsProductSliders(BuildContext context, ProductDetailsModel productInfo) {
    return

      productInfo.productImages!.isEmpty?
      Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      height: 200,
      child: CarouselSlider.builder(
        itemCount: 1,
        slideBuilder: (index) {
          return Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: Image.network(
              '${ApiURL.globalUrl}${productInfo.imageThumb}',
              fit: BoxFit.fitWidth,
            ),
          );
        },
        slideTransform: CubeTransform(),
        slideIndicator: CircularSlideIndicator(
            padding: EdgeInsets.only(bottom: 12),
            indicatorRadius: 4,
            itemSpacing: 12,
            currentIndicatorColor: Colors.red,
            indicatorBackgroundColor: Colors.grey),
      ),
    ) :Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        height: 250,
        child: CarouselSlider.builder(
          itemCount: productInfo.productImages!.length,
          slideBuilder: (index) {
            return Container(

             // width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(100)),
              child: Image.network(
                '${ApiURL.globalUrl}${productInfo.productImages![index].imageUrl}',
                fit: BoxFit.contain,
              ),
            );
          },
          slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 12),
              indicatorRadius: 4,
              itemSpacing: 12,
              currentIndicatorColor: Colors.red,
              indicatorBackgroundColor: Colors.grey),
        ),
      );
  }

  productInfo() {}
  productDescriptionSpecification() {
    return DefaultTabController(
        length: 2,
        child: Container(
          height: 100,
          width: 300,
          color: Colors.greenAccent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_car)),

                ],
              ),
              TabBarView(
                children: [
                  Text('Description here Details '),
                  Text('Specification Here Details')
                ],
              ),
            ],
          ),
        ));
  }

  relateProductList() {}
  reviewRating() {}

  ///My Cart BottomSheet
  _buildBottomSheetMyCartProductDetails(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      /*  shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.zero,
                topLeft: Radius.circular(30), //Radius.zero,
                //bottomRight: Radius.circular(20),
                topRight: Radius.circular(30)),
            side: BorderSide(width: 1, color: Colors.pink)),*/
      context: context,
      builder: (context) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: 250.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              color: Colors.white,
            ),
            child: const AddToCart());
      },
    );
  }

  bottomMyCartBuyNowBTN(BuildContext context, ProductDetailsModel productInfo) {
    print('test>>${controller.productDetailsInfo.value.price}');
    print('pId>>${controller.productDetailsInfo.value.id}');
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 67.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9D9D9D).withOpacity(0.16),
              offset: Offset(0, 0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: <Widget>[
              InkWell(
                  onTap: (){
                    ///Click Fav

                    if (is_logged_in.$) {
                      controller.addWishListCTR(productInfo.id.toString());
                    } else {
                      Get.offNamed(Routes.AUTHENTICATION);
                    }


                  },
                  child: Icon(Icons.favorite_border)),
              Spacer(flex: 18),


              InkWell(
                //Add to Cart
                onTap: () {
                  print('ProductDetailsView.bottomMyCartBuyNowBTN ');
                  var id = controller.productDetailsInfo.value.id;
                  print('id>>${id}');

                  if(productInfo.stock==0){
                    Get.snackbar(
                      'Not Enough Product In Stock.',
                      productInfo.name.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 2),
                    );
                  }
                  else{

                  var cartProduct = NewProductModel(
                    cartProductName: productInfo.name,
                    cartProductImage: productInfo.imageThumb,
                    cartItemProductId: int.parse(controller.productDetailsInfo.value.id.toString()),
                    cartItemProductVariantId: 1,
                    cartItemProductPrice: productInfo.price,// double.parse(productInfo.price.toString()),
                    cartItemProductQuantity: 1, // int.parse(qty.toString()),
                    cartItemTotalPrice: productInfo.price,//double.parse( productInfo.price.toString()),
                    cartItemDiscountPerProduct: '1',
                    productStock:  productInfo.stock.toString()
                  );
                  pDetailsCTR.addToCart(cartProduct);

                  print('cartProduct ::  ${jsonEncode(cartProduct)}');

                  Get.snackbar(
                    'Item has been added',
                    productInfo.name.toString(),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    duration: const Duration(seconds: 2),
                  );
                  }
                  // _buildBottomSheetMyCartProductDetails(context);
                },
                child: Container(
                  alignment: Alignment.topRight,
                  width: 130.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xFFD81D4C),
                    ),
                  ),
                  child: SizedBox(
                    width: 130.0,
                    height: 36.0,
                    child: Row(
                      children: <Widget>[
                        Spacer(flex: 18),
                        Align(
                          alignment: Alignment(0.0, -0.06),
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                       SizedBox(width: 7,),
                       // Spacer(flex: 12),
                       //pDetailsCTR
                       Obx(() => Container(
                         alignment: Alignment.center,
                         width: 45.0,
                         height: 36.0,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5.0),
                           color: const Color(0xFFFC6600).withOpacity(0.16),
                         ),
                         child: Text(
                           pDetailsCTR.productInfoWithQty.length.toString(),
                           style: TextStyle(
                             fontSize: 16.0,
                             color:
                             CtmColors.appColor,
                             //const Color(0xFF021E65),
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ))

                      ],
                    ),
                  ),
                ),
              ),
              Spacer(flex: 10),
              InkWell(
                onTap: () {

                  print('IsLogged ');
                  print('UserId >> ${user_id.$}');
                  print(is_logged_in.$);

                  if (is_logged_in.$) {
                    if(productInfo.stock==0){
                    Get.snackbar(
                    'Not Enough Product In Stock.',
                    productInfo.name.toString(),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    duration: const Duration(seconds: 2),
                    );
                    }
                    else {
                      var cartProduct = NewProductModel(
                          cartProductName: productInfo.name,
                          cartProductImage: productInfo.imageThumb,
                          cartItemProductId: int.parse(
                              controller.productDetailsInfo.value.id.toString()),
                          cartItemProductVariantId: 1,
                          cartItemProductPrice: productInfo.price,
                          // double.parse(productInfo.price.toString()),
                          cartItemProductQuantity: 1,
                          // int.parse(qty.toString()),
                          cartItemTotalPrice: productInfo.price,
                          //double.parse( productInfo.price.toString()),
                          cartItemDiscountPerProduct: '1',
                          productStock: productInfo.stock.toString()
                      );
                      pDetailsCTR.addToCart(cartProduct);

                      Get.offNamed(Routes.CHECKOUT);
                      //}
                    }
                  } else {
                    Get.offAllNamed(Routes.AUTHENTICATION);
                  }
                  print('Click CheckOut');
                },
                child: Container(
                  alignment: Alignment(0.01, -0.06),
                  width: 152.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xFF18042C)
                      //Theme.of(context).primaryColor
                    //Colors.pink,
                  ),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  productVariantView(){
    return  Container(
      height: Get.width/2,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ColorPicker(
            colors: controller.colors,
            selectedIndex: controller.selectedColor.value,
            onChanged: (value) {
              controller.selectedColor.value=value;
            },
          ),


          SizedBox(height: 10,),

          SizePicker(
            sizes: controller.sizes,
            selectedIndex: controller.selectedSize.value,
            onChanged: (value) {
              controller.selectedSize.value=value;
            },
          ),

        /*  const Text('Sizes :  ',style: TextStyle(
            fontSize: 14.0,
            color: const Color(0xFF333333),
            fontWeight: FontWeight.w500,
            height: 1.44,
          )),
          const SpaceH15(),
          Container(
            height: 40,

            child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext c,int index){

                  return    Container(

                    child: Center(child: Text('LARGE  $index',style: TextStyle(
                      fontSize: 10.0,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w500,
                      height: 1.44,
                    ))),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 20,width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.green.shade400)),
                  );

                }),
          ),*/
        ],),

    );
  }

  /// Related Product
  productListRelatedView() {
    return Obx(() {
      if (controller.productRelatedList.isEmpty) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: Get.size.width / 2,
          child: const Center(
            child: Text('No Found Data !'),
          ),
        );
      } else {
        return ProductRelatedListWidget(productRelatedList: controller.productRelatedList,);
      }
    });
  }

  _description (){
    return Container(
      
      height: 200,
      color: Colors.red,
      child: DefaultTabController(
        length: 2,
        child: Column(children: const [
           TabBar(tabs: [
        Tab(icon: Icon(Icons.flight)),
    Tab(icon: Icon(Icons.directions_transit)),

    ],),
          SizedBox(height: 10,),
          TabBarView(
            children: [
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),

            ],
          ),

          
        ],),
      ),
    );
  }

  /// Review List By Product Id


  _buildReviewList() {
    return Obx(() {
      if (controller.productReviewList.isEmpty) {
        return

          Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: Get.size.width / 4,
          child: const Center(
            child: Text('No review found Data !',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        );
      } else {
        return ReviewListWidget(reviewList: controller.productReviewList);
        //  return ProductListWidget(productList: controller.productRelatedList,);
      }
    });
  }


}


