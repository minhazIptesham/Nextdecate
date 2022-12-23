import 'dart:convert';

import 'package:gameleven/app/data/models/user_info_model.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/helpers.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../../data/repositories/authentications.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';
import '../../../routes/app_pages.dart';

class AuthenticationController extends GetxController {
  /*
   testing purpose
    user mail : adnan2@gmail.com
    mobile : 00000000000 /01840000000
    password : 000000 /123456

   */


  //TODO: Implement AuthenticationController
  var phoneNumber = ''.obs;
  var password = ''.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

   @override
  void dispose() {
    // TODO: implement dispose
   phoneController.dispose();
   phoneController.clear();
   passwordController.clear();
   loginFormKey.currentState!.dispose();
    passwordController.dispose();
     super.dispose();
  }
  dynamic loginController({required BuildContext context}) async {
    try {
      final ProgressDialog progressDialog = DBHelper.loadingDialog(Get.overlayContext!);
      progressDialog.show();

      var resValue = await Authentication().loginRepo(
          phone: phoneController.text, password: passwordController.text);

      var bodyMap = json.decode(resValue.body);
      if (bodyMap['status'] == 'success') {
        progressDialog.hide();
         bool isLogged = await DBHelper.object.setUserData(bodyMap['user_info'][0]);

        if(isLogged){
          progressDialog.hide();
          Get.toNamed(Routes.BOTTOMNAVIGATIONBAR);

        }
      }
      else {
        progressDialog.hide();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login has Wrong!')));
      }
      phoneController.clear();
      passwordController.clear();
    } catch (error) {
      if (kDebugMode) {
        print('AuthenticationController._loginController $error');
      }
    }
  }
}
