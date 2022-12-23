import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../../../data/brandList.dart';

import '../../../data/utiles/app_colors.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_cart_controller.dart';

class ProductCartView extends GetView<ProductCartController> {
  const ProductCartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle cartItemStyle = const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      height: 1.36,
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarWidget('ShoppingCart'.tr),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0.0),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  var show = blist().wishlistname[index];
                  var show2 = blist().wishlistname2[index];
                  var showbrandicon = blist().wishlisticon[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext) {},
                          backgroundColor: CtmColors.appColor,
                          icon: Icons.edit,
                          label: 'Edit'.tr,
                        ),
                        SlidableAction(
                          onPressed: (BuildContext) {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (param) {
                                return
                                  AlertDialog(
                                  actions: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child:  Text(
                                          'CANCEL'.tr,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            height: 1.36,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 8.0),
                                      child: ElevatedButton(
                                        /*minWidth: 80.0,
                                          color: const Color(0xFF0A0A5A),*/
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
                                  title:  Text(
                                    'AreYouSureDeleteProductsCart'.tr,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color:  Color(0xFF1F1F1F),
                                      height: 1.36,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete'.tr,
                        )
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  "$showbrandicon",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Power Bank Water Gold ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                height: 1.06,
                                              ),
                                            ),
                                            Text(
                                              'Sound Box',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: const Color(0xFF7E7E7E),
                                                height: 1.06,
                                              ),
                                            ),
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
                                            value: false,
                                            shape: const CircleBorder(),
                                            onChanged: (bool? value) {
                                              /*  setState(() {
                                                  isChecked = value!;
                                                });*/
                                            },
                                          ),
                                          //Text('check')
                                        )
                                      ],
                                    ),
                                    Text(
                                      '$show2',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xFFB2B2B2),
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '$show',
                                            style: cartItemStyle,
                                          ),
                                          // Group: Group 348

                                          SizedBox(
                                            width: 100.0,
                                            height: 35.0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 35.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.0),
                                                    color: Colors.grey.withOpacity(0.1),
                                                    //color:  const Color(0xFFF0F0F0),
                                                  ),
                                                  child: Text(
                                                    '+',
                                                    style:
                                                    TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.black.withOpacity(0.5),
                                                      //fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '01',
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black.withOpacity(0.5),
                                                    //fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 35.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.0),
                                                    color: Colors.grey.withOpacity(0.1),
                                                  ),
                                                  child: Text(
                                                    '-',
                                                    style:
                                                    TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.black.withOpacity(0.5),
                                                      //fontWeight: FontWeight.w500,
                                                    )
                                                    //  cartIncrementDecrementStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
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
                  );
                },
              ),
            ),
            _buildCheckOutBtnCard(context),

          ],
        ),
      ),
    );
  }

  _buildCheckOutBtnCard(context){
    return Container(
      width: Get.width,
      height: 100,
      color: Colors.white24,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty,
                  value: false,
                  shape: const CircleBorder(),
                  onChanged: (bool? value) {},
                ),
                const Text('ALL',)
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
                children: const <TextSpan>[
                  TextSpan(
                      text: 'SAR 2000.00', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                ],
              ),
            ),




            InkWell(
              onTap: (){
                Get.toNamed(Routes.CHECKOUT);
                print('Click CheckOut');

          },
              child: Container(
                alignment: Alignment.center,
                width: 140.0,
                height: 36.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xFF18042C),
                  //const Color(0xFFD81D4C),
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
          ] ),
    );
  }
}
