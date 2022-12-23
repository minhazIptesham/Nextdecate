import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gameleven/app/data/models/product_card_model.dart';
import 'package:gameleven/app/data/models/product_related_model.dart';
import 'package:gameleven/app/data/utiles/api_url.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:get/get.dart';

import '../data/brandList.dart';
import '../data/models/new_productinfo_model.dart';
import '../modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../modules/product_details/controllers/product_details_controller.dart';
import '../routes/app_pages.dart';

class ProductRelatedListWidget extends StatelessWidget {
  var productRelatedList;
  ProductRelatedListWidget({Key? key, this.productRelatedList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productDetails = Get.put(ProductDetailsController());

    return Container(


      color: Colors.grey.shade200,
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),

        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 6,
        itemCount: productRelatedList.length,
        itemBuilder: (context, index) {
          ProductRelatedModel pInfo = productRelatedList[index];
          return InkWell(
            onTap: () async {
              productDetails.productId.value = pInfo.id!;
              productDetails.productCategoryId.value = pInfo.categoryId!;
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
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.blue,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child:

                          Image.network(
                            '${ApiURL.globalUrl}${pInfo.imageThumb}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        pInfo.name.toString(),

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

                              color: Color(0xFFD81D4C),
                              fontWeight: FontWeight.w500,
                              height: 1.42,
                            ),
                          ),
                        ),
                        InkWell(
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

                           //   bottomNavCTR.addToCart(cartProduct);
                              Get.snackbar(
                                'Item has been added',
                                pInfo.name.toString(),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                duration: const Duration(seconds: 2),
                              );
                            } else {
                           //   _stockAlert();
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
                      padding: const EdgeInsets.only(left: 12.0, right: 0.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.red, size: 10),
                          Icon(Icons.star, color: Colors.red, size: 10),
                          Icon(Icons.star, color: Colors.red, size: 10),
                          Icon(Icons.star, color: Colors.red, size: 10),
                          Icon(Icons.star, color: Colors.red, size: 10),

                          Text('(12)',
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
          );
        },
        staggeredTileBuilder: (int index)=>
            StaggeredTile.count(3, index.isEven?3.9:4.1),
        crossAxisSpacing:  2.0,
        mainAxisSpacing:  1.0,


      ),
    );

    /*return SingleChildScrollView(
      child: GridView.builder(
        physics: ScrollPhysics(),
        itemCount: productRelatedList.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 234),
        itemBuilder: (context, index) {
          ProductRelatedModel pInfo=productRelatedList[index];
          return InkWell(
            onTap: () async{
              print('pId :${pInfo.id}');
              productDetails.productId.value=pInfo.id!;
              productDetails.productCategoryId.value=pInfo.categoryId!;

              print('pass controller id  :${productDetails.productId.value}');
              await productDetails.productDetailsCTR();
               await productDetails.productDetailsRelatedCTR();

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
                          height: 120,
                          width: MediaQuery.of(context).size.width ,
                          //color: Colors.blue,
                          child: Image.network('${ApiURL.globalUrl}${pInfo.imageThumb}',fit: BoxFit.fill,),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(pInfo.name.toString(),
                          style: TextStyle(
                            fontSize: 12.0,
                            color:  CtmColors.appColor,
                            //const Color(0xFF021E65),
                            height: 1.42,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Padding(
                             padding: const EdgeInsets.only(left:10),
                             child: Text(
                              ' ৳ '+ pInfo.price.toString(),
                              style:  TextStyle(
                                fontSize: 12.0,

                                 color: Color(0xFFD81D4C),
                               // color: Color(0xFFD81D4C),
                                fontWeight: FontWeight.w500,
                                height: 1.42,
                              ),
                          ),
                           ),
                          Container(
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
    );*/
  }
}
