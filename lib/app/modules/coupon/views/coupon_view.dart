import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/coupon_model.dart';

import 'package:get/get.dart';

import '../../../data/utiles/ShimmerLoading.dart';
import '../../../global_widgets/empty_data_widget.dart';
import '../controllers/coupon_controller.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
class CouponView extends GetView<CouponController> {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:    Colors.grey.shade200,
      appBar: AppBar(
        title:  Text('CouponList'.tr),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoadingCouponData.value) {
            if (controller.coupons.isEmpty) {
              return EmptyDataWidget('NoCoupons'.tr);
            } else {
              return ListView.builder(
                itemCount: controller.coupons.length,
                itemBuilder: (context, index) {
                  CouponModel couponModel = controller.coupons[index];
                  return

                    Container(
                 // color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                    width: double.infinity,
                    child: CouponUIWidget(couponModel),
                  );
                },
              );
            }
          } else {
            return ShimmerLoading().buildShimmerReview();
          }
        },
      ),
    );
  }

}



class CouponUIWidget extends StatelessWidget {
  CouponModel couponModel;


  CouponUIWidget(this.couponModel);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xfff1e3d3);
    const Color secondaryColor = Color(0xffd88c9a);



    return CouponCard(
      height: 170,
      backgroundColor: primaryColor,
      clockwise: true,
      curvePosition: 135,
      curveRadius: 30,
      curveAxis: Axis.vertical,
      borderRadius: 10,
      firstChild: Container(
        decoration: const BoxDecoration(
          color: secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${couponModel.discountAmount }%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'OFF'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white54, height: 0),
             Expanded(
              child: Center(
                child: Text(
                  '${couponModel.couponName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      secondChild: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             Text(
              'CouponCode'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '${couponModel.couponDiscountCode}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'Valid Till - ${couponModel.endDate}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




