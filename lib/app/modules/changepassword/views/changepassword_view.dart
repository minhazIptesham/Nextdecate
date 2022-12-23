import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/utiles/app_colors.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_textform_field.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../../global_widgets/spaceH30.dart';
import '../controllers/changepassword_controller.dart';

class ChangepasswordView extends GetView<ChangepasswordController> {
  const ChangepasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          physics: const ScrollPhysics(),
          child: _buildChangePasswordForm(context),
        ),
      ),
    );
  }

  _buildChangePasswordForm(context) {
    return Form(
      key: controller.changePasswordFormKey,
      child: Column(
        children: [
          CustomAppBarWidget('ChangePassword'.tr,isBackButton: true),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             /*   SizedBox(
                  width: 100.0,
                  height: 120.0,
                  child: Image.asset(
                    "assets/change_password.jpg",
                    fit: BoxFit.fill,
                  ),
                ),*/

                const SpaceH30(),
                const SpaceH30(),
                CustomTextFormField(
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  controller: controller.oldPasswordController,
                  hintText: 'OldPassword'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PleaseEnterYourOldPassword'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.oldPassword.value=value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  controller: controller.newPasswordController,
                  hintText: 'NewPassword'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PleaseEnterYourNewPassword'.tr;
                    } else if (value.length < 6) {
                      return 'PasswordMustBe6characters'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.newPassword.value = value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock),

                  obscureText: true,
                  controller: controller.confirmPasswordController,
                  hintText: "Confirm Password ",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PleaseEnterYourConfirmPassword'.tr;
                    }else if (value.length < 6) {
                      return 'PasswordMustBe6characters'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.confirmPassword.value = value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),

                const SpaceH30(),
                _buildChangePasswordBtn(context),
                SizedBox(height: MediaQuery.of(context).size.height / 65),
                const SpaceH30(),
                const SpaceH30(),

              ],
            ),
          ),

        ],
      ),
    );
  }

  _buildChangePasswordBtn(context) {
    return InkWell(
      onTap: () {
        if (controller.changePasswordFormKey.currentState!.validate()) {
          controller.changePasswordFormKey.currentState!.save();

          if(controller.newPasswordController.text==controller.confirmPasswordController.text){
            controller.changePasswordCTR(context: context);
          }else{
            Get.snackbar(
              'newConfirmPassMatch'.tr,
              'PleaseTryAgain'.tr,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.white,
              colorText: Colors.red,
              duration: const Duration(seconds: 4),
            );
          }

        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 58.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: CtmColors.appColor,
        ),
        child:  Center(
          child: Text(
            'ChangePassword'.tr,
            style:  const TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
