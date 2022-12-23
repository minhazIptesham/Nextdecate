import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/sub_category_model.dart';
import '../../../data/utiles/api_url.dart';
import '../../../global_widgets/custom_app_drawer.dart';
import '../../../global_widgets/empty_data_widget.dart';
import '../../../global_widgets/slider.dart';
import '../../../init_first_controller/init_first_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bottomnavigationbar_controller.dart';

class NavHomeScreen extends StatelessWidget {
  const NavHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var controller = Get.put(InitFirstController());

    return SafeArea(
      child: Scaffold(

        drawer: const CustomAppDrawer(),
        body: Obx(
          () {
            if (controller.categories.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(

                        backgroundColor: const Color(0xFF18042C),

                        title:  Row(

                          children:[
                             Image.asset(
                              'assets/logo.png',
                              width: 40,
                              height: 40,
                              // color: Colors.green,
                            ),
                            Text(
                              'Nextech Mart',
                              style: TextStyle(color: Colors.white,fontSize: 14),
                            ),
                        ]
                        ),

                        leading: InkWell(
                            onTap: (){
                              Scaffold.of(context).openDrawer();
                            },
                            child: Icon(Icons.menu,color: Colors.white,)),

                        pinned: true,
                        floating: true,
                        actions: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SEARCH);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                        bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(51.0),
                            child: _buildAppBar(context, controller)),
                      ),
                    ];
                  },
                  body: _buildBody(context, controller));
            }
          },
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context, InitFirstController controller) {
    return Obx((){
      return Row(
          children: [
            InkWell(
              onTap: () {

                controller.tapCount.value = 1;
                print(controller.tapCount.value);
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                  decoration: controller.tapCount.value == 1
                      ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: controller.tapCount.value == 1
                            ? Colors.white
                            : Colors.grey,
                        width: 2.0,
                      ),
                    ),
                  )
                      : const BoxDecoration(),
                  child: Text(
                    'Home'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: controller.tapCount.value == 1 ? Colors.white : Colors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:
                    TabBar(
                        controller: controller.tapController,
                        isScrollable: true,
                        labelColor:
                        controller.tapCount.value == 0 ? Colors.white : Colors.grey,
                        unselectedLabelColor:  Colors.grey,
                        indicatorColor: controller.tapCount.value == 0
                            ? Colors.white
                            : Colors.black,
                        labelStyle: TextStyle(fontSize: 15),
                        // indicatorWeight: 4,
                        labelPadding: EdgeInsets.only(right: 14),
                        onTap: (value) {
                          controller.tapCount.value=0;

                          controller.categoryById.value = controller.categories[value].categoryId;
                          controller.homeSubCategoriesCTR1();
                        },
                        tabs: controller.categories
                            .map(
                              (e) => Tab(
                            child: Text(e.name),
                          ),
                        )
                            .toList()),
                  ),
                )),
          ],
        );
      });

  }

  _buildBody(BuildContext context, InitFirstController controller) {
    return Obx(() {

      if (controller.tapCount.value == 1) {
        return HomeSliderView();
      } else {
       if (controller.isLoadingData.value) {
          if (controller.subCategories.isEmpty) {
            return EmptyDataWidget('ProductDataNotFound'.tr);
          } else {
            return Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 15),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                  controller: controller.tapController,
                  children: controller.subCategories
                      .map(
                        (e) =>  Container(


                          color: Colors.grey.shade200,
                          child: StaggeredGridView.countBuilder(
                            physics: NeverScrollableScrollPhysics(),

                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            crossAxisCount: 6,
                            itemCount: controller.subCategories.length,
                            itemBuilder: (context, index) {
                              SubCategoryModel pInfo = controller.subCategories[index];
                              return InkWell(
                                onTap: () async {
                                 /* productDetails.productId.value = pInfo.id!;
                                  productDetails.productCategoryId.value = pInfo.categoryId!;
                                  await productDetails.productDetailsCTR();
                                  await productDetails.productDetailsRelatedCTR();
                                  Get.toNamed(Routes.PRODUCT_DETAILS);*/
                                },
                                child:  Container(
                                  margin: EdgeInsets.symmetric(vertical: 10,horizontal:5),
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
                                              child:

                                              Image.network(
                                                '${ApiURL.globalUrl}${pInfo.catImage}',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            pInfo.categoryName.toString(),

                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                ' ৳ ',
                                                style: const TextStyle(

                                                  color: Color(0xFFD81D4C),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.42,
                                                ),
                                              ),
                                            ),
                                           /* InkWell(
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
                                            ),*/
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
                                StaggeredTile.count(3, index.isEven?4:4),
                            crossAxisSpacing:  2.0,
                            mainAxisSpacing:  1.0,


                          ),
                        )

                            /*SingleChildScrollView(
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            itemCount: controller.subCategories.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    mainAxisExtent: 234),
                            itemBuilder: (context, index) {
                              SubCategoryModel pInfo =
                                  controller.subCategories[index];
                              return InkWell(
                                onTap: () async {
                                  *//* print('pId :${pInfo.id}');
                                    productDetails.productId.value=pInfo.id!;
                                    productDetails.productCategoryId.value=pInfo.catId!;
                                    print('pass controller id  :${productDetails.productId.value}');
                                    await productDetails.productDetailsCTR();
                                    await productDetails.productDetailsRelatedCTR();
                                    Get.toNamed(Routes.PRODUCT_DETAILS);*//*
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              //color: Colors.blue,
                                              child: Image.network(
                                                //'https://www.statewideproducts.com/wp-content/uploads/product-placeholder.jpg'
                                                '${ApiURL.globalUrl}${pInfo.catImage}',
                                                fit: BoxFit.fitWidth,
                                                //fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            pInfo.categoryName.toString(),
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: const Color(0xFF434343),
                                              height: 1.42,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ' ৳  2554',
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color(0xFFD81D4C),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.42,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  *//*    var id = bottomNavCTR.productDetailsInfo.value.id;
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
                                                    );*//*
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              231,
                                                              226,
                                                              226),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.5)),
                                                  child: const Icon(
                                                    Icons
                                                        .shopping_cart_outlined,
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
                        ),*/
                      )
                      .toList()),
            );
          }
        } else {
          return const SizedBox(
              height: 200, child: Center(child: CircularProgressIndicator()));
        }
      }
    });
  }

/*  _buildCardItem(){
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
              Get.toNamed(Routes.PRODUCT_DETAILS);
            },
            child:  Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal:5),
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
            StaggeredTile.count(3, index.isEven?4:5),
        crossAxisSpacing:  2.0,
        mainAxisSpacing:  1.0,


      ),
    );
  }*/
}
