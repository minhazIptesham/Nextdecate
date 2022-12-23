import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:get/get.dart';
import '../../../data/models/wishlist_model.dart';
import '../../../data/utiles/ShimmerLoading.dart';
import '../../../data/utiles/api_url.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../routes/app_pages.dart';
import '../../product_details/controllers/product_details_controller.dart';
import '../../product_wishlist/controllers/product_wishlist_controller.dart';

class NavWishListScreen extends StatelessWidget {
  const NavWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductDetailsController productDetails = Get.put(ProductDetailsController());

    return SingleChildScrollView(
     // physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarWidget('Wish List'),
            _buildGetWishList(context, productDetails),
          ],
        ),
      ),
    );
  }

  _buildGetWishList(context, ProductDetailsController productDetails) {
    return GetX<ProductWishlistController>(
        init: ProductWishlistController(),
        builder: (controller) {
          if (controller.isLoadingGetWishData.value) {
            if (controller.wishlist.isEmpty) {
              return Container(
                  height: Get.height / 2,
                  child:  Center(
                      child: Text(
                    'WishListIsEmpty'.tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )));
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  primary: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.wishlist.length,
                  itemBuilder: (BuildContext ctx, int idx) {
                    WishListModel wish = controller.wishlist[idx];

                    return InkWell(
                      onTap: () async {
                        productDetails.productId.value = wish.productId!;
                        productDetails.productCategoryId.value = wish.productId!;
                        await productDetails.productDetailsCTR();
                        await productDetails.productDetailsRelatedCTR();
                        await productDetails.reviewListByProductCTR();
                        Get.toNamed(Routes.PRODUCT_DETAILS);
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(10),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.network(
                                      '${ApiURL.globalUrl}${wish.imageThumb}',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.blue,
                                  height: MediaQuery.of(context).size.height,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        wish.name.toString(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: const Color(0xFF7E7E7E),
                                          height: 1.06,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        ' ৳ ' + wish.price.toString(),
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: const Color(0xFFD81D4C),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              //SizedBox(width: 5),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  child: CustomPaint(
                                    //   painter: Chevron(),
                                    child: GestureDetector(
                                      onTap: () {

                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (param) {
                                            return AlertDialog(
                                              actions: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0,
                                                          bottom: 8.0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      controller
                                                          .removeWishListCTR(
                                                              wish.wishlistId
                                                                  .toString());
                                                    },
                                                    child:  Text(
                                                      'OK'.tr,
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white,
                                                        height: 1.36,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                CtmColors
                                                                    .appColor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: ElevatedButton(
                                                    onPressed: () => Get.back(),
                                                    child: Text(
                                                      'CANCEL'.tr,
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white,
                                                        height: 1.36,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              title:  Text(
                                                'DeleteTheSelectedProductsFromTheCart'.tr,
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
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 65.0,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Image.asset(
                                            "assets/delete.png",
                                            fit: BoxFit.cover,
                                            height: 30,
                                            width: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  });
            }
          } else {
            return ShimmerLoading().buildShimmerReview();
          }
        });
  }

}
