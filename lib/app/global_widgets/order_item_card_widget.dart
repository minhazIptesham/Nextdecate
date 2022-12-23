import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:gameleven/app/data/utiles/local_helper/cart_local_store.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../data/brandList.dart';
import '../data/models/order_model.dart';
import '../modules/order/controllers/order_controller.dart';
import '../routes/app_pages.dart';

class OrderItemCardWidget extends StatelessWidget {
  OrderModel orderModel ;
  OrderController controller;

  OrderItemCardWidget(this.orderModel,this.controller);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      //scrollDirection: Axis.vertical,
      child:   Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 7),
          margin: EdgeInsets.symmetric(vertical: 2,horizontal: 7),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'Order ID : ${orderModel.orderId.toString()}',
                      style: TextStyle(
                        fontSize: 12.0,

                      ),
                    ),
                    Text(
                      'Total Amount : ${orderModel.totalAmount}',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Order Status  : ${orderModel.status}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color:orderModel.status=='Pending'? Colors.red:Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async{
                        print('orderId : ${orderModel.orderId}');

                        controller.orderId.value=orderModel.orderId.toString();
                      await controller.getOrderDetailsInfo(context);
                        Get.toNamed(Routes.ORDER_DETAILS);

                    },
                      child: Container(
                        width: 80.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade400,
                        ),
                        child: Center(
                          child: Text(
                            'Details'
                                ,style: TextStyle(color: CtmColors.appColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '${orderModel.date.toString()}',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,

                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
