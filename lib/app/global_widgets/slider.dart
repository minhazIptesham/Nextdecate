import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gameleven/app/global_widgets/product_widget_hz.dart';
import '../data/models/brand_model.dart';
import '../data/models/hot_categories_model.dart';
import 'package:gameleven/app/global_widgets/product_widget.dart';
import 'package:gameleven/app/global_widgets/spaceH15.dart';
import 'package:get/get.dart';

import '../data/models/slider_model.dart';
import '../data/utiles/app_colors.dart';
import '../init_first_controller/init_first_controller.dart';
import '../modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../modules/product_categories/views/hot_categories_view_all.dart';
import '../routes/app_pages.dart';
import 'empty_data_widget.dart';

class HomeSliderView extends StatefulWidget {
  const HomeSliderView({Key? key}) : super(key: key);

  @override
  State<HomeSliderView> createState() => _HomeSliderViewState();
}

class _HomeSliderViewState extends State<HomeSliderView> {
  var homeNav = Get.put(InitFirstController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 0),
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 0),
          child: Column(children: [
            /// Slider
            _buildSlider(),
            const SpaceH15(),
            /// Brand
            _buildBrandList(),
            const SpaceH15(),
           // const Center(child: Text('Best Sale HZ ')),
             _buildSBestSaleProducts(),

            _buildSAllProducts(),
            //   ProductListView(),
            //SizedBox(height: 225),
          ]),
        )
      ],
    );
  }

  _buildSlider() {
    return Obx(() {
      if (homeNav.sliderList.isEmpty) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: Get.size.width / 2,
          child: CarouselSlider.builder(
            unlimitedMode: true,
            itemCount: homeNav.sliderImageHolders.length,
            slideBuilder: (index) {
              return Image.asset(
                homeNav.sliderImageHolders[index],
                fit: BoxFit.fill,
              );
            },
            slideTransform: const CubeTransform(
              rotationAngle: 0,
            ),
            slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 10),
                indicatorRadius: 4,
                itemSpacing: 10,
                currentIndicatorColor: Colors.red,
                indicatorBackgroundColor: Colors.white),
          ),
        );
      } else {
        return Center(
          child: SizedBox(
            height: Get.width / 2.8,

            child: CarouselSlider.builder(
              unlimitedMode: true,
              itemCount: homeNav.sliderList.length,
              viewportFraction: 1,
              slideBuilder: (index) {
                SliderModel d = homeNav.sliderList[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 2,right: 5,top: 8),
                  child:

                  Container(
                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),),
                      alignment: Alignment.center,
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            d.sliderImage.toString(),
                            height: 200,
                            width: 400,
                            fit: BoxFit.fill,
                          ),
                        )

                      ),
                );
              },
              slideTransform: const CubeTransform(
                rotationAngle: 0,
              ),
              autoSliderTransitionTime: const Duration(seconds: 2),
              enableAutoSlider: true,
              autoSliderDelay: const Duration(seconds: 5),
              slideIndicator: CircularSlideIndicator(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  indicatorRadius: 4,
                  itemSpacing: 17,
                  // alignment: Alignment.bottomRight,
                  currentIndicatorColor: CtmColors.appColor,
                  indicatorBackgroundColor: const Color(0xffE0E0E0)),
            ),
          ),
        );
      }
    });
  }



  _buildSAllProducts() {
    return Obx(() {
      if (homeNav.homeAllProductList.isEmpty) {
        return const SizedBox(
          height: 200,
          child: Center(child: Text('product not found!')),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
           // color: const Color(0xFF24CAAA).withOpacity(0.07),
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Center(child: Text('JUST FOR YOU ',style: TextStyle(fontSize: 18),)),
              ),
              ProductListWidget(productList: homeNav.homeAllProductList)
            ],
          ),
        );
      }
    });
  }


  _buildHotMenuItemFromHome() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      //height: 146,
      height: MediaQuery.of(context).size.width / 3 - 20,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: _buildHomeFirstLineMenu(
                'Coupons', 'coupons_bg.png', 'coupon.png', 1),
          ),
          Expanded(
            flex: 1,
            child: _buildHomeFirstLineMenu(
                'Gift Card', 'gift_card_bg.png', 'gift_card.png', 2),
          ),
          Expanded(
            flex: 1,
            child: _buildHomeFirstLineMenu(
                'Slash', 'slash_bg.png', 'slash.png', 3),
          ),
          Expanded(
            flex: 1,
            child: _buildHomeFirstLineMenu(
                'PC Assemble', 'pc_assemble_bg.png', 'pc_assemble.png', 4),
          ),
        ],
      ),
    );
  }

  _buildHomeFirstLineMenu(
      String menuName, imageBgPath, imageInnerBgPath, int countIndex) {
    return GestureDetector(
      onTap: () => {
        if (countIndex == 1)
          {Get.toNamed(Routes.COUPON)}
        else if (countIndex == 2)
          {Get.toNamed(Routes.GIFTCARD)}
        else if (countIndex == 3)
          {Get.toNamed(Routes.SLASH)}
        else if (countIndex == 4)
          {
            //Get.toNamed(Routes.COUPON)
          }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              // width: 83,
              child: Image.asset('assets/$imageInnerBgPath'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage('assets/$imageBgPath'),
                    fit: BoxFit.cover),
              ),
            ),

            // Image.asset(imageBgPath),
            SizedBox(
              height: 5,
            ),
            Text(
              menuName,
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  _buildBrandList() {
    return Obx(() {
      if (homeNav.brandList.isEmpty) {
        return const SizedBox(
          height: 200,
          child: Center(child: Text('Brand Data Found!')),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            //color: const Color(0xFF24CAAA).withOpacity(0.07),
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 10.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Brands',
                          style: TextStyle(
                            color: CtmColors.appColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: InkWell(
                        onTap: () {
                          print('Click Brand more ');
                          Get.toNamed(Routes.BRANDS);
                        },
                        child: Text(
                          'View More'.tr,
                          style: TextStyle(
                              color: CtmColors.appRedColor,
                              fontWeight: FontWeight.w500,
                              //fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                    itemCount: homeNav.brandList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      BrandModel brandInfo = homeNav.brandList[index];
                      return InkWell(
                        onTap: () {
                          /// Click Brand
                          homeNav.brandWiseProductId.value=brandInfo.brandId.toString();
                          homeNav.homeBrandWiseProductCTR();
                          Get.toNamed(Routes.BRANDWISE_PRODUCT);
                        },
                        child: Container(
                          width: 100,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF7F7F7),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(left: 8, right: 6,bottom: 5),
                                height: 90,
                                child: Image.network(
                                  'https://soft29.bdtask.com/nextdecade/${brandInfo.brandImage}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF18042C),
                                    //Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(right: 6, left: 8,bottom: 5),
                                height: 30,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    brandInfo.brandName.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );

                      //Text('Brand Name :${brandInfo.brandName}');
                    }),
              ),
            ],
          ),
        );
      }
    });
  }

  ///
  _buildSBestSaleProducts() {
    return Obx(() {
      if (homeNav.homeBaseSaleList.isEmpty) {
        return const SizedBox(
          height: 200,
          child: Center(child: Text('product not found!')),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            //  color: const Color(0xFF24CAAA).withOpacity(0.07),
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 10.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Best Sale ',
                          style: TextStyle(

                            color: CtmColors.appColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: InkWell(
                        onTap: () {
                          print('Click Sale  more ');
                         Get.toNamed(Routes.MOREVALL_PRODUCT);
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                            color: CtmColors.appRedColor,
                            fontWeight: FontWeight.w500,
                              //fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               ProductListWidgetHZ(productList: homeNav.homeBaseSaleList)
            ],
          ),
        );
      }
    });
  }

  _buildHotCategoriesList() {
    return Obx(() {
      if (homeNav.categories.isEmpty) {
        return const SizedBox(
          height: 200,
          child: Center(child: Text('Category Data Found!')),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            // color: const Color(0xFF24CAAA).withOpacity(0.07),
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 10.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Hot Categories',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Color(0xFF434343),
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              /// Click
                              print('Click Brand more ');
                              Get.to(const CategoriesViewAll());
                            },
                            child: Text(
                              'View More',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                    itemCount: homeNav.hotCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      HotCategoriesModel hotCategories =
                          homeNav.hotCategories[index];
                      //   print('categories lng ::: ${homeNav.hotCategories.length}');
                      return Container(
                        width: 100,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF7F7F7),
                                  borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.only(left: 8, right: 6),
                              height: 80,
                              child: Image.network(
                                'https://soft29.bdtask.com/nextdecade/${hotCategories.catImage}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF18042C),
                                  //Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.only(right: 6, left: 8),
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  hotCategories.categoryName.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      );

                      //Text('Brand Name :${brandInfo.brandName}');
                    }),
              ),
            ],
          ),
        );
      }
    });
  }

  imageSlider(imagePath) {
    return Image.network(imagePath, fit: BoxFit.fill);
  }
}
