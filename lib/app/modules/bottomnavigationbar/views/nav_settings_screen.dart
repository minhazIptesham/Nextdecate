import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/user_profile_model.dart';
import 'package:gameleven/app/data/utiles/app_strings.dart';
import 'package:get/get.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';
import '../../../data/utiles/local_helper/shared_value_helper.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/spaceH10.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../../routes/app_pages.dart';
import '../../update_profile/controllers/update_profile_controller.dart';

class NavSettingsScreen extends StatelessWidget {
  const NavSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarWidget(AppStrings.account),
            _buildProfileInfo(),
            const SpaceH10(),
            _accountMenuItemRow(),
            _accountMenuItem(),
          ],
        ),
      )),
    );
  }

  _buildProfileInfo() {
    return GetX<UpdateProfileController>(
        init: UpdateProfileController(),
        builder: (controller) {
          if (controller.isLoadingGetProfileData.value) {
            if(controller.profileInfo.isEmpty){
              print('controller.profileInfo${controller.profileInfo.length}');
              return Container(
                width: double.infinity,
                height: 186.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9D9D9D).withOpacity(0.16),
                      offset: Offset(0, 0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Container(
                        height: 110,
                        width: 110,
                        child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 50,
                            )),
                      ),
                    ),
                    const Text(
                      ' User Name ',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF404040),
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    const Text(
                      '018********',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF9F9F9F),
                        height: 1.5,
                      ),
                    ),
                    const Text(
                      'example@gmail.com',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF9F9F9F),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              );
            }else{
              UserProfileModel uInfo = controller.profileInfo[0];
              return Container(
                width: double.infinity,
                height: 186.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9D9D9D).withOpacity(0.16),
                      offset: Offset(0, 0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // image != null
                    //     ? ClipOval(
                    //         child: Image.file(image!,
                    //             width: 120, height: 120, fit: BoxFit.cover),
                    //       )
                    //     : Center(child: const Text("Image not found")),

                    CircleAvatar(
                      radius: 40,
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: const BoxDecoration(
                          //color: Colors.red,
                          // borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                              image: AssetImage('assets/profile_holder.png'),
                              fit: BoxFit.cover),
                        ),
                        child: const Center(child: Text("")),
                      ),
                    ),
                    Text(
                      uInfo.name.toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF404040),
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      uInfo.mobile.toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF9F9F9F),
                        height: 1.5,
                      ),
                    ),
                    Text(
                      uInfo.email.toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF9F9F9F),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              );
            }

          } else {
            return Container(
              width: double.infinity,
              height: 186.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9D9D9D).withOpacity(0.16),
                    offset: Offset(0, 0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Container(
                      height: 110,
                      width: 110,
                      child: const Center(
                          child: Icon(
                        Icons.person,
                        size: 50,
                      )),
                    ),
                  ),
                  const Text(
                    ' User Name ',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF404040),
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  const Text(
                    '018********',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF9F9F9F),
                      height: 1.5,
                    ),
                  ),
                  const Text(
                    'example@gmail.com',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF9F9F9F),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  _accountMenuItemRow() {
    return user_id.$ != ""
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Expanded(
                    child: _menuItemUIWithRowClick(
                        'OrderHistory'.tr, const Icon(Icons.reorder), 1)),
                Expanded(
                    child: _menuItemUIWithRowClick(
                        'CouponList'.tr, const Icon(Icons.card_giftcard), 2))
              ],
            ),
          )
        : Container();
  }

  _accountMenuItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          user_id.$ != ""
              ? _menuItemUIWithClick(
                  'UpdateProfile'.tr, const Icon(Icons.person), 1)
              : Container(),
          user_id.$ != ""
              ? _menuItemUIWithClick(
                  'ChangePassword'.tr, const Icon(Icons.lock), 8)
              : Container(),
          user_id.$ == ""
              ? _menuItemUIWithClick(
                  'RegisterNow'.tr, const Icon(Icons.login), 2)
              : Container(),
          _menuItemUIWithClick('AboutUs'.tr, const Icon(Icons.person), 3),
          _menuItemUIWithClick('PrivatePolicy'.tr, Icon(Icons.policy), 4),
          _menuItemUIWithClick(
              'TermsAndCondition'.tr, Icon(Icons.note_alt_sharp), 5),
          _menuItemUIWithClick('language'.tr, Icon(Icons.language), 6),
          user_id.$ != ""
              ? _menuItemUIWithClick('logout'.tr, Icon(Icons.logout), 7)
              : Container(),
        ],
      ),
    );
  }

  _menuItemUIWithClick(String title, Icon icon, int itemCount) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(0)),
        ),
        //color: Colors.white,
        child: ListTile(
          onTap: () {
            if (itemCount == 1) {
              Get.toNamed(Routes.UPDATE_PROFILE);
            } else if (itemCount == 2) {
              Get.offAllNamed(Routes.REGISTER);
            } else if (itemCount == 3) {
              Get.toNamed(Routes.ABOUTUS);
            } else if (itemCount == 4) {
              Get.toNamed(Routes.POLICY);
            } else if (itemCount == 5) {
              Get.toNamed(Routes.TERMSANDCONDITION);
            } else if (itemCount == 6) {
              Get.toNamed(Routes.SELECT_LANGAUGE);
            } else if (itemCount == 7) {
              DBHelper.object.clearUserData();
              Get.offAndToNamed(Routes.AUTHENTICATION);
            } else if (itemCount == 8) {
              Get.toNamed(Routes.CHANGEPASSWORD);
            }
          },
          leading: icon,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          trailing: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )),
        ),
      ),
    );
  }

  alertLanguage() {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text(
              'CANCEL',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                height: 1.36,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
          child: ElevatedButton(
            /*minWidth: 80.0,
                                          color: const Color(0xFF0A0A5A),*/
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                height: 1.36,
              ),
            ),
          ),
        ),
      ],
      title: const Text(
        'Lanaguage ',
        style: TextStyle(
          fontSize: 14.0,
          color: const Color(0xFF1F1F1F),
          height: 1.36,
        ),
      ),
    );
  }

  _menuItemUIWithRowClick(String title, Icon icon, int index) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          if (index == 1) {
            Get.toNamed(Routes.ORDER);
          } else {
            Get.toNamed(Routes.COUPON);
          }
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 0.2,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            //color: Colors.white,
            child: Row(
              children: [
                CircleAvatar(radius: 18, child: icon),
                //icon,
                SizedBox(
                  width: 10,
                ),
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontStyle: FontStyle.italic)),
              ],
            )),
      ),
    );
  }
}
