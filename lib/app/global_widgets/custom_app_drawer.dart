import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:gameleven/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../data/utiles/local_helper/cart_local_store.dart';
import '../data/utiles/local_helper/shared_value_helper.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.0,
             // 0.0
            ],
                colors: [
              CtmColors.appWhiteColor,
             // CtmColors.appColor.withOpacity(0.2),
            ])),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        CtmColors.appColor, CtmColors.appColor

                        //Theme.of(context).primaryColor,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2, color: Colors.yellow),
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: const Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/logo.png',
                            width: 50,
                            height: 50,
                            // color: Colors.green,
                          )
                          //Icon(Icons.person, size: 50, color: Colors.grey.shade300,),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Nextech Mart',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),

            _buildDrawerMenuTitle(Icon(Icons.home, size: 18), 'Home ', 1),
            user_id.$ == ""
                ? _buildDrawerMenuTitle(
                    Icon(Icons.app_registration, size: 18), 'Register Now ', 2)
                : Container(),
            _buildDrawerMenuTitle(
                Icon(Icons.contacts, size: 18), 'About Us ', 3),
            _buildDrawerMenuTitle(Icon(Icons.sticky_note_2_sharp, size: 18),
                'Terms And Condition ', 4),
            _buildDrawerMenuTitle(Icon(Icons.policy, size: 18), 'Policy ', 5),
            _buildDrawerMenuTitle(
                Icon(Icons.phone, size: 18), 'Contact US ', 6),
            user_id.$ != ""
                ? _buildDrawerMenuTitle(
                    Icon(Icons.logout, size: 18), 'Logout', 0)
                : Container(),

            Spacer(),
            Column(
              children: [
                Text(
                  'CopyRight@Nextech Ltd',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                Text(
                  'version : 1.0.0',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: CtmColors.appColor),
                ),
              ],
            )
            //_buildDrawerMenuTitle(Icon(Icons.logout,size: 18),'logout',0),
          ],
        ),
      ),
    ));
  }

  _buildDrawerMenuTitle(Icon icon, String name, int number) {
    return ListTile(
      onTap: () {
        switch (number) {
          case 1:
            {
              Get.back();
              break;
            }
          case 2:
            {
              print('CustomAppDrawer._buildDrawerMenuTitle Register');

              Get.toNamed(Routes.REGISTER);
              break;
            }
          case 3:
            {
              Get.toNamed(Routes.ABOUTUS);
              print('CustomAppDrawer._buildDrawerMenuTitle About');
              break;
            }
          case 4:
            {
              Get.toNamed(Routes.TERMSANDCONDITION);
              print('CustomAppDrawer._buildDrawerMenuTitle Terms');
              break;
            }
          case 5:
            {
              Get.toNamed(Routes.POLICY);
              print('CustomAppDrawer._buildDrawerMenuTitle Policy');
              break;
            }
          case 6:
            {
              Get.toNamed(Routes.CONTACTUS);
              print('CustomAppDrawer._buildDrawerMenuTitle Contact');
              break;
            }
          case 0:
            {
              print('CustomAppDrawer._buildDrawerMenuTitle logout');

              DBHelper.object.clearUserData();
              Get.offAndToNamed(Routes.AUTHENTICATION);
              break;
            }
        }
      },
      title: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 16, color: CtmColors.appColor),
      ),
      leading: CircleAvatar(
        backgroundColor: CtmColors.appColor,
        radius: 18,
        child: icon,
      ),
    );
  }
}
