import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/utiles/app_colors.dart';
import '../../../data/utiles/app_strings.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_textform_field.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../../global_widgets/spaceH30.dart';
import '../controllers/contactus_controller.dart';

class ContactusView extends GetView<ContactusController> {
  const ContactusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SafeArea(
        child:
        //_buildContactUsForm(context)

        SingleChildScrollView(
          reverse: true,
          physics: const ScrollPhysics(),
          child: _buildContactUsForm(context),
        ),
      ),

    );
  }
  _buildContactUsForm(context) {
    return Form(
      key: controller.contactUsFormKey,
      child: Column(
        children: [
          CustomAppBarWidget('ContactUs'.tr,isBackButton: true),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   SizedBox(
                  width: 120.0,
                  height: 140.0,
                  child: Image.asset(
                    "assets/call-centre.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text('GetInTouch'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                Text('YourEmailAddressWillNotBePublished'.tr,style: TextStyle(fontSize: 10),),

                const SpaceH30(),
                CustomTextFormField(

                  prefixIcon:  Icon(Icons.drive_file_rename_outline,color: CtmColors.appColor,),
                  controller: controller.firstNameController,
                  hintText: 'FirstName'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PleaseEnterYourFirstName'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                   // controller.oldPassword.value=value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),
                CustomTextFormField(
                  prefixIcon:  Icon(Icons.drive_file_rename_outline,color: CtmColors.appColor,),
                  controller: controller.lastNameController,
                  hintText: 'LastName'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PleaseEnterYourLastName'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                  //  controller.newPassword.value = value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),
                CustomTextFormField(
                  prefixIcon:  Icon(Icons.mail,color: CtmColors.appColor,),

                  controller: controller.emailController,
                  hintText:'EmailAddress'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PleaseEnterYourEmailAddress'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                   // controller.confirmPassword.value = value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),


                CustomTextFormField(
                  maxLine: 4,
              //    prefixIcon: const Icon(Icons.mail),


                  controller: controller.messageController,
                  hintText: 'WriteYourMessageHere'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PleaseEnterYourMessage'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // controller.confirmPassword.value = value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),

                const SpaceH15(),
                const SpaceH15(),
                _buildContactUsBtn(context),
                SizedBox(height: MediaQuery.of(context).size.height / 65),
                const SpaceH30(),


              ],
            ),
          ),

        ],
      ),
    );
  }

  _buildContactUsBtn(context) {
    return InkWell(
      onTap: () {
        if (controller.contactUsFormKey.currentState!.validate()) {
          controller.contactUsFormKey.currentState!.save();


            controller.contactUsController(context: context);
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
            'Submit'.tr,
            style: const TextStyle(
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
