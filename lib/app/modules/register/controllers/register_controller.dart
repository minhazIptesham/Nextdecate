import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/authentications.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  bool isChecked = false;
  bool isHidePassword = false;
  var userFName = ''.obs;
  var userLName = ''.obs;
  var userMail = ''.obs;
  var userPhone = ''.obs;
  var userBirth = ''.obs;
  var userPass = ''.obs;
  final count = 0.obs;

  final isCheckPolicyAgree = false.obs;

  dynamic registerController({required Map rgMapBody, required BuildContext context}) async {
    try {
      Authentication()
          .registerRepo(rgMapBody: rgMapBody)
          .timeout(const Duration(seconds: 500))
          .then((value) {
        if (value) {

          print('Registration has been successful!');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration has been successful!')));
          Get.offAllNamed(Routes.AUTHENTICATION);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration has Wrong!')));
        }
      }).onError((error, stackTrace) => null);

      fNameController.clear();
      lNameController.clear();
      emailController.clear();
      phoneController.clear();
      passwordController.clear();
    } catch (e) {
      if (kDebugMode) {
        print('RegisterController.registerController error:$e');
      }
    }
  }
}
