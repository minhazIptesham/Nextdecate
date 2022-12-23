import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:get/get.dart';

import '../../product_details/controllers/product_details_controller.dart';
import '../../product_wishlist/controllers/product_wishlist_controller.dart';
import '../controllers/bottomnavigationbar_controller.dart';

class TabBarMaterialWidget extends StatelessWidget {
  final int index2;
  final ValueChanged<int> onChangedTab;
  const TabBarMaterialWidget({
    super.key,
    required this.index2,
    required this.onChangedTab,
  });

  @override
  Widget build(BuildContext context) {
    var bottomNavCTR = Get.put(BottomNavigationbarController());

    var wishCTR = Get.put(ProductWishlistController());

    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 70,
        color: Colors.grey.withOpacity(0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: buildTabItem(
                    index: 0,
                    icon: const Icon(Icons.category_outlined, size: 14),
                    name: 'Categories'.tr)),
            Expanded(
                child: Stack(children: [
              buildTabItem(
                  index: 1,
                  icon: const Icon(Icons.favorite_border, size: 16),
                  name: "Wish List"),
              Obx(() {
                return wishCTR.wishlist.length==0
                    ? Container()
                    : Positioned(
                        left: 30,
                        top: 5,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: Text(
                              wishCTR.wishlist.length.toString(),
                              style: TextStyle(
                                  color: CtmColors.appColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )),
                      );
              })
            ])),
            Expanded(
                child: buildTabItem(
                    index: 2,
                    icon: const Icon(Icons.home, size: 16),
                    name: 'Home'.tr)),
            Expanded(
                child: Stack(children: [
              buildTabItem(
                  index: 3,
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 16,
                  ),
                  name: 'Cart'.tr),
              Obx(() {
                return bottomNavCTR.productInfoWithQty.length == 0
                    ? Container()
                    : Positioned(
                        left: 30,
                        top: 5,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: Text(
                              bottomNavCTR.productInfoWithQty.length.toString(),
                              style: TextStyle(
                                  color: CtmColors.appColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )),
                      );
              })
            ])),
            Expanded(
                child: buildTabItem(
                    index: 4,
                    icon: const Icon(
                      Icons.person,
                      size: 16,
                    ),
                    name: 'Account'.tr)),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
    required String name,

  }) {
    final isSelected = index == index2;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Color(0xFF18042C) : Colors.grey,
      ),
      child: MaterialButton(
        minWidth: 20,
        //icon: icon,

        onPressed: () =>onChangedTab(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon.icon,
              color: isSelected ? Color(0xFF18042C) : Colors.grey,
            ),
            Text(
              name,
              style: TextStyle(
                  color: isSelected ? Color(0xFF18042C) : Colors.grey,
                  fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
