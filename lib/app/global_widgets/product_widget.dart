import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gameleven/app/data/models/product_card_model.dart';
import 'package:gameleven/app/data/utiles/api_url.dart';
import 'package:get/get.dart';

import '../data/brandList.dart';
import '../data/models/new_productinfo_model.dart';
import '../data/utiles/app_colors.dart';
import '../modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../modules/product_details/controllers/product_details_controller.dart';
import '../routes/app_pages.dart';

class ProductListWidget extends StatelessWidget {
  var productList;
  ProductListWidget({Key? key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productDetails = Get.put(ProductDetailsController());
    var bottomNavCTR = Get.put(BottomNavigationbarController());

   return SingleChildScrollView(
      child:  Container(
        color: Colors.grey.shade200,
        child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 6,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            ProductCardModel pInfo = productList[index];
            return InkWell(
              onTap: () async {
                productDetails.productId.value = pInfo.id!;
                productDetails.productCategoryId.value = pInfo.catId!;
                await productDetails.productDetailsCTR();
                await productDetails.productDetailsRelatedCTR();
                await productDetails.reviewListByProductCTR();
                Get.toNamed(Routes.PRODUCT_DETAILS);
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
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.blue,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network('${ApiURL.globalUrl}${pInfo.imageThumb}', fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                     Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                pInfo.name.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.visible,

                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
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
                                ),
                              
                                Expanded(
                                  child: InkWell(
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
                                          'Item has been added',
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
                                      margin: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                      decoration: BoxDecoration(
                                          color:
                                          Colors.grey.shade500,
                                          borderRadius: BorderRadius.circular(5)),
                                      child:  Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 18,
                                        color: Colors.white,
                                      ),
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
          },
          staggeredTileBuilder: (int index)=>
              StaggeredTile.count(3, index.isOdd? 4.0:3.8),
          crossAxisSpacing:  3.0,
          mainAxisSpacing:  2.0,


        ),
      )
    );
  }
  _stockAlert() {
    Get.dialog(
      AlertDialog(
        title: const Text('Stock Out'),
        content: const Text('product is not available'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
}
