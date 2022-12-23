import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gameleven/app/data/models/order_details_model.dart';
import 'package:gameleven/app/data/models/order_model.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';

import 'package:get/get.dart';

import '../../../data/utiles/api_url.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_textform_field.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../order/controllers/order_controller.dart';
import '../../order/views/order_view.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       /*appBar: AppBar(
        title: const Text('Order Details '),
        centerTitle: true,
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWidget('Order Details',isBackButton: true,),
              orderInfo(context),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 29.0,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              orderDetailsInfo(context),

            ],
          ),
        ),
      ),
    );
  }
  orderDetailsInfo(BuildContext context) {
    return GetX<OrderController>(
        builder: (controller) {
          if(controller.orderDetailsInfo.isEmpty){
            return   Center(child:  Text ('OrderDetailsNotFound'.tr));
          }
          return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.orderDetailsInfo.length,
                itemBuilder: (BuildContext ctx,int idx){
                  //mainCategories.categories[idx].isSelectActive=false;
                 OrderDetailsModel orderDetailsInfo=controller.orderDetailsInfo[idx];
                  return    Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(

                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      '${ApiURL.globalUrl}${orderDetailsInfo.productImage}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                /*  decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${ApiURL.globalUrl}${cartItems.productInfo!.cartProductImage}'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),*/
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderDetailsInfo.productName
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF7E7E7E),
                                        fontWeight: FontWeight.bold,
                                        height: 1.06,
                                      ),
                                    ),
                                    Text(
                                      '${orderDetailsInfo.rate.toString()} X ${orderDetailsInfo.quantity.toString()}',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xFFB2B2B2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      ' ৳ ' +
                                          orderDetailsInfo.rate.toString()
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xFFD81D4C),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(child: InkWell(
                                 onTap: (){
                                   /// Alert Review
                                   openDialog(controller);

                                 },
                                child: Icon(Icons.reviews,color: Colors.yellow,)))
                          ],
                        ),
                      ),
                    ),
                  );
                });
        }
    );
  }

  orderInfo(BuildContext context) {
    return GetX<OrderController>(
        builder: (controller) {
          if(controller.orderInfo.isEmpty){
            return   Center(child:  Text ('OrderDetailsNotFound'.tr));
          }
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (BuildContext ctx,int idx){
                    OrderModel orderInfo=controller.orderInfo[idx];
                return

                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                 child:  Column(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                  keyValueSummary('OrderId:'.tr,orderInfo.orderId.toString()),
                   keyValueSummary('totalAmount'.tr,'৳ ${orderInfo.totalAmount.toString()}'),
                   keyValueSummary('discountAmount'.tr,'৳ 0.0'),
                   keyValueSummary('dueAmount'.tr,'৳ ${orderInfo.dueAmount.toString()}'),
                  keyValueSummary('OrderStatus'.tr,orderInfo.status.toString()),
                  keyValueSummary('OrderDate'.tr,orderInfo.date.toString()),

                ],
                 ),
                );


              });
        }
    );
  }

  keyValueSummary(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              key,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                ' : $value',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF7E7E7E),
                ),
              )),
        ],
      ),
    );
  }

  openDialog ( OrderController controller) {
    Get.dialog(
      AlertDialog(
        icon: InkWell(
          onTap: (){
            Get.back();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 15,
                  child: Icon(Icons.close,color: Colors.white,)),
            ],
          ),
        ),

        title:  Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const SpaceH15(),
          RatingBar.builder(

            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              size: 16,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),

            const SpaceH15(),

            const SpaceH15(),
            CustomTextFormField(
              maxLine: 4,
              prefixIcon: const Icon(Icons.reviews),
              controller: controller.reviewController,
              hintText: 'Comments'.tr,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'PleaseEnterFirstName'.tr;
                }
                return null;
              },
              onSaved: (value) {
                //controller.userFName.value = value!;
              },
              //obscureText: _isVisible ? false : true,
            ),
            const SpaceH15(),

            //Center(child: Text('Submitted succesfully',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
            SizedBox(height: 10,),

            TextButton(
              onPressed: () {
                 /// Click
                controller.reviewProduct();
              },
              child:  Text('ReviewSubmit'.tr,style: TextStyle(fontSize: 18,color: CtmColors.appColor),),
            ),
          ],
        ),

      ),
    );
  }

}
