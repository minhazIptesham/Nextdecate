import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:gameleven/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../data/repositories/authentications.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';

class ContactusController extends GetxController {
  //TODO: Implement ContactusController
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> contactUsFormKey = GlobalKey<FormState>();

  final count = 0.obs;
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
  }

  void increment() => count.value++;

  contactUsController({required BuildContext context}) {
    ProgressDialog pr= DBHelper.loadingDialog(context);
    pr.show();
    Authentication().contactUsRepo(
        fName: firstNameController.text.trim(),
        lName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        message: messageController.text.trim()).then((value) {
      if (value) {
        pr.hide();
        openDialog();

      } else {
        pr.hide();
        Get.snackbar(' Messages Alert ','Submitting has failed !',
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(Get.width *0.5),
            backgroundColor: CtmColors.appColor,
            colorText: Colors.red);

      }
    });

  }

  openDialog() {
    Get.dialog(
      AlertDialog(
        icon: InkWell(
          onTap: (){
            Get.back();
          },
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 15,
                  child: Icon(Icons.close,color: Colors.white,)),
            ],
          ),
        ),

        title:  Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(
              "assets/successful.gif",
              fit: BoxFit.cover,
            ),
            Center(child: Text('Submitted succesfully',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
            SizedBox(height: 10,),


            TextButton(
              onPressed: () {
                //Get.back();
                Get.toNamed(Routes.BOTTOMNAVIGATIONBAR);
              },
              child:  Text("Home",style: TextStyle(fontSize: 18,color: CtmColors.appColor),),
            ),
          ],
        ),

      ),
    );
  }
}
