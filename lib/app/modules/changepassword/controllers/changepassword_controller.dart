import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../data/repositories/authentications.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';
import '../../../routes/app_pages.dart';

class ChangepasswordController extends GetxController {
  //TODO: Implement ChangepasswordController

  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changePasswordCTR({required BuildContext context}) {
    ProgressDialog pr= DBHelper.loadingDialog(context);
    pr.show();
   try{
     Authentication()
         .changePasswordRepo(
         oldPass: oldPasswordController.text.trim(),
         newPass: newPasswordController.text.trim())
         .then((value) {
       if (value) {
         pr.hide();
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
             content: Text('Change password has been successful!')));
         Get.offAllNamed(Routes.AUTHENTICATION);
       } else {
         pr.hide();
         ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Change password has failed !')));
       }
     });

     oldPasswordController.clear();
     newPasswordController.clear();
     confirmPasswordController.clear();
   }catch(e){

   }


  }
}
