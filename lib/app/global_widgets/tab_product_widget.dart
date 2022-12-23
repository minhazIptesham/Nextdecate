import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/product_card_model.dart';
import 'package:gameleven/app/data/utiles/api_url.dart';
import 'package:get/get.dart';

import '../data/brandList.dart';
import '../data/models/new_productinfo_model.dart';
import '../modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../modules/product_details/controllers/product_details_controller.dart';
import '../routes/app_pages.dart';

class TabProductListWidget extends StatelessWidget {
  var productList;
  TabProductListWidget({Key? key, this.productList}) : super(key: key);

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
          ProductCardModel pInfo=productList[index];
          return InkWell(
            onTap: () async{
             /* print('pId :${pInfo.id}');
              productDetails.productId.value=pInfo.id!;
              productDetails.productCategoryId.value=pInfo.catId!;
              print('pass controller id  :${productDetails.productId.value}');
              await productDetails.productDetailsCTR();
               await productDetails.productDetailsRelatedCTR();
               Get.toNamed(Routes.PRODUCT_DETAILS);*/
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
                          height: 100,
                          width: MediaQuery.of(context).size.width ,
                          //color: Colors.blue,
                          child: Image.network(
                          'https://www.statewideproducts.com/wp-content/uploads/product-placeholder.jpg'
                            //  '${ApiURL.globalUrl}${pInfo.imageThumb}',fit: BoxFit.fitWidth,
                           ,fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(pInfo.name.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF434343),
                          height: 1.42,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            ' ৳ '+pInfo.price.toString(),
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFFD81D4C),
                              fontWeight: FontWeight.w500,
                              height: 1.42,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              var id = bottomNavCTR.productDetailsInfo.value.id;
                              print('id>>${id}');
                              var cartProduct = NewProductModel(
                                cartItemProductId: int.parse(
                                    bottomNavCTR.productDetailsInfo.value.id.toString()),
                                cartItemProductVariantId: 1,
                                cartItemProductPrice: 100,
                                cartItemProductQuantity: 1, // int.parse(qty.toString()),
                                cartItemTotalPrice: '100',
                                cartItemDiscountPerProduct: '1',
                                productStock: bottomNavCTR.productDetailsInfo.value.stock.toString()
                              );
                              bottomNavCTR.addToCart(cartProduct);
                              Get.snackbar(
                                'Item has been added',
                                'products.name',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                duration: const Duration(seconds: 2),
                              );
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 231, 226, 226),
                                  borderRadius: BorderRadius.circular(12.5)),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 18,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ],
                      )
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
}
