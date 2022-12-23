import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/product_card_model.dart';
import 'package:gameleven/app/data/models/search_model.dart';
import 'package:gameleven/app/data/utiles/api_url.dart';
import 'package:get/get.dart';

import '../data/brandList.dart';
import '../data/models/new_productinfo_model.dart';
import '../data/utiles/app_colors.dart';
import '../modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../modules/product_details/controllers/product_details_controller.dart';
import '../routes/app_pages.dart';

class SearchProductListWidget extends StatelessWidget {
  var productList;
  SearchProductListWidget({Key? key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productDetails = Get.put(ProductDetailsController());
    var bottomNavCTR = Get.put(BottomNavigationbarController());

    return SingleChildScrollView(
      child: GridView.builder(
        physics: ScrollPhysics(),
        itemCount: productList.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 234),
        itemBuilder: (context, index) {
          SearchModel pInfo = productList[index];
          return InkWell(
            onTap: () async {
              print('pId :${pInfo.id}');
              productDetails.productId.value = pInfo.id!;
              productDetails.productCategoryId.value = pInfo.catId!;
              print('pass controller id  :${productDetails.productId.value}');
              await productDetails.productDetailsCTR();
              await productDetails.productDetailsRelatedCTR();
              await productDetails.reviewListByProductCTR();
              Get.toNamed(Routes.PRODUCT_DETAILS);
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.blue,
                          child: Image.network(
                            '${ApiURL.globalUrl}${pInfo.imageThumb}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          pInfo.name.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: CtmColors.appColor,
                            //const Color(0xFF021E65),
                            fontWeight: FontWeight.bold,
                            height: 1.42,
                          ),
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
                                fontSize: 14.0,
                                color: Color(0xFFD81D4C),
                                fontWeight: FontWeight.w500,
                                height: 1.42,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('ProductListWidget.build Add To cart');
                              print('pId:${pInfo.id}');
                              print('name:${pInfo.name}');
                              print('price:${pInfo.price}');
                              print('image:${pInfo.imageThumb}');

                              print('stock :${pInfo.stock}');

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
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          children: [
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
            ),
          );
        },
      ),
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
