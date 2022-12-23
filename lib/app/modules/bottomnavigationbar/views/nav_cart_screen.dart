import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../data/models/new_productinfo_model.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import 'package:get/get.dart';
import '../../../data/models/product_cart_model.dart';
import '../../../data/utiles/api_url.dart';
import '../../../data/utiles/app_styles.dart';
import '../../../data/utiles/local_helper/shared_value_helper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../routes/app_pages.dart';

class NavCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetX<BottomNavigationbarController>(
            init: BottomNavigationbarController(),
            builder: (controller) {
              return controller.productInfoWithQty.isEmpty
                  ? _emptyCart()
                  : _buildCartBody(context, controller);
            }),
      ),
    );
  }

  _buildCartBody(BuildContext context, controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAppBarWidget('Shopping Cart'),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.productInfoWithQty.length,
            itemBuilder: (context, index) {
              ProductCart cart = controller.productInfoWithQty[index];
              return _buildCart(context, controller.productInfoWithQty[index],
                  index, controller);
            },
          ),
        ),
        _buildCheckOutBtnCard(context, controller)
      ],
    );
  }

  _buildCart(context, ProductCart cartItem, index, controller) {
    NewProductModel? items = cartItem.productInfo;

    var isCheckItem = cartItem.isCheckProductCart;
    //  var qty = cartItem.productQty;
    var qty = items!.cartItemProductQuantity;

    if (kDebugMode) {
      print('qty $qty');
    }

    return  Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: 140,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child:

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${ApiURL.globalUrl}${items?.cartProductImage}',
                    fit: BoxFit.fill,
                  ),
                ),
              )
            /* Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.network(
                  '${ApiURL.globalUrl}${items?.cartProductImage}',
                  fit: BoxFit.fitWidth,
                ),
              ),*/
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                //color: Colors.blue,
                height: MediaQuery.of(context).size.height,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.productInfo!.cartProductName
                                  .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.black.withOpacity(0.8),
                                height: 1.06,
                              ),
                            ),
                            /*const Text(
                                'Sound Box',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF7E7E7E),
                                  height: 1.06,
                                ),
                              ),*/
                          ],
                        ),
                        //Icon(Icons.favorite),

                        Container(
                          height: 20,
                          width: 30,
                          //color: Colors.red,
                          child: Checkbox(
                            checkColor: Colors.white,
                            // fillColor: MaterialStateProperty,
                            value: cartItem.isCheckProductCart,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              controller.singleCardItemSelect(value, index);
                              //cartItem.isCheckProductCart = value!;
                            },
                          ),
                          //Text('check')
                        )
                      ],
                    ),
                    Text(
                      '$qty * ৳ ${items?.cartItemProductPrice.toString()}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFB2B2B2),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '',
                            style: cartItemStyle,
                          ),
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    print(controller.count);
                                    print('Increment Qty Item');


                                    NewProductModel? cartProduct = cartItem.productInfo;

                                    if (cartProduct!.cartItemProductQuantity > 0) {
                                      controller.addToCartQtyIncrement(index);
                                    }

                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 35.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                      color: Colors.grey.withOpacity(0.1),
                                      //color:  const Color(0xFFF0F0F0),
                                    ),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black.withOpacity(0.5),
                                        //fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  qty.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black.withOpacity(0.5),
                                    //fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print('click (-)');
                                    NewProductModel? cartProduct = controller.productInfoWithQty[index].productInfo;

                                    /* if(cartItem.productInfo!.productStock>=cartItem.productInfo!.cartItemProductQuantity){

                                      }*/

                                    if(cartProduct!.cartItemProductQuantity>1){
                                      controller.addToCartQtyDecrement(index);
                                    }else{
                                      controller.removeFromCart(index);

                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 35.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                      color: Colors.grey.withOpacity(0.1),
                                    ),
                                    child: Text('-',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          //fontWeight: FontWeight.w500,
                                        )
                                      //  cartIncrementDecrementStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

   /* return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: ScrollMotion(),
        children: [
         *//* SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: Colors.blue,
            icon: Icons.edit,
            label: 'Edit',
          ),*//*
         *//* SlidableAction(
            onPressed: (BuildContext context) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (param) {
                  return AlertDialog(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              height: 1.36,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                        child: ElevatedButton(
                          *//**//*minWidth: 80.0,
                                          color: const Color(0xFF0A0A5A),*//**//*
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              height: 1.36,
                            ),
                          ),
                        ),
                      ),
                    ],
                    title: const Text(
                      'Are you sure you want to delete the selected Products from the cart?',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF1F1F1F),
                        height: 1.36,
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          )*//*
        ],
      ),
      child:

      Container(
        margin: const EdgeInsets.only(bottom: 5),
        height: 140,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child:

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${ApiURL.globalUrl}${items?.cartProductImage}',
                    fit: BoxFit.fill,
                  ),
                ),
              )
             *//* Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.network(
                  '${ApiURL.globalUrl}${items?.cartProductImage}',
                  fit: BoxFit.fitWidth,
                ),
              ),*//*
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  //color: Colors.blue,
                  height: MediaQuery.of(context).size.height,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.productInfo!.cartProductName
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.black.withOpacity(0.8),
                                  height: 1.06,
                                ),
                              ),
                              *//*const Text(
                                'Sound Box',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF7E7E7E),
                                  height: 1.06,
                                ),
                              ),*//*
                            ],
                          ),
                          //Icon(Icons.favorite),

                          Container(
                            height: 20,
                            width: 30,
                            //color: Colors.red,
                            child: Checkbox(
                              checkColor: Colors.white,
                              // fillColor: MaterialStateProperty,
                              value: cartItem.isCheckProductCart,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                controller.singleCardItemSelect(value, index);
                                //cartItem.isCheckProductCart = value!;
                              },
                            ),
                            //Text('check')
                          )
                        ],
                      ),
                      Text(
                        '$qty * ৳ ${items?.cartItemProductPrice.toString()}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB2B2B2),
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '',
                              style: cartItemStyle,
                            ),
                            SizedBox(
                              width: 100.0,
                              height: 35.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      print(controller.count);
                                      print('Increment Qty Item');


                                      NewProductModel? cartProduct = cartItem.productInfo;

                                      if (cartProduct!.cartItemProductQuantity > 0) {
                                        controller.addToCartQtyIncrement(index);
                                      }

                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 35.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey.withOpacity(0.1),
                                        //color:  const Color(0xFFF0F0F0),
                                      ),
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black.withOpacity(0.5),
                                          //fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    qty.toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black.withOpacity(0.5),
                                      //fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print('click (-)');
                                      NewProductModel? cartProduct = controller.productInfoWithQty[index].productInfo;

                                     *//* if(cartItem.productInfo!.productStock>=cartItem.productInfo!.cartItemProductQuantity){

                                      }*//*

                                      if(cartProduct!.cartItemProductQuantity>1){
                                       controller.addToCartQtyDecrement(index);
                                     }else{
                                        controller.removeFromCart(index);

                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 35.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey.withOpacity(0.1),
                                      ),
                                      child: Text('-',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            //fontWeight: FontWeight.w500,
                                          )
                                          //  cartIncrementDecrementStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
  }

  _buildCheckOutBtnCard(context, controller) {
    return Container(
      width: Get.width,
      height: 100,
      color: Colors.white24,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              checkColor: Colors.white,
              // fillColor: MaterialStateProperty,
              value: controller.isSelectItems.value,
              shape: const CircleBorder(),
              onChanged: (bool? value) {
                controller.allCardItemSelect(value);
              },
            ),
            const Text(
              'ALL',
            )
          ],
        ),
        RichText(
          overflow: TextOverflow.clip,
          textAlign: TextAlign.end,
          textDirection: TextDirection.rtl,
          softWrap: true,
          maxLines: 1,
          textScaleFactor: 1,
          text: TextSpan(
            text: 'Total : ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: ' ৳ ' + controller.totalPrice.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('IsLogged ');
            print('UserId >> ${user_id.$}');
            print(is_logged_in.$);

            if (is_logged_in.$) {
              Get.offNamed(Routes.CHECKOUT);
            } else {
              Get.offNamed(Routes.AUTHENTICATION);
            }
            print('Click CheckOut');
          },
          child: Container(
            alignment: Alignment.center,
            width: 140.0,
            height: 36.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xFF18042C),
              //CtmColors.appColor,
            ),
            child: const Text(
              'Check Out',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  _emptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/empty_cart_holder.png'),

          /* Container(
                       margin: EdgeInsets.symmetric(vertical: 50,horizontal: 5),
                alignment: Alignment.center,
                width: 150,
                height: 50,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(40.0),
                  color: CtmColors.appColor,
                ),
                child: const Text(
                  'Show Now',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),*/
        ],
      ),
    );
  }
}
