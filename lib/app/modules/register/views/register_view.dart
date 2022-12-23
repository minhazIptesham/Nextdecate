import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:gameleven/app/data/utiles/app_strings.dart';
import 'package:get/get.dart';
import '../../../data/utiles/theme_helper.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_text_field_widget.dart';
import '../../../global_widgets/custom_textform_field.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWidget(AppStrings.signUp),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                      child: _buildRegisterForm(context)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildRegisterForm(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      width: MediaQuery.of(context).size.width / 1.15,
      child: Form(
        key: controller.registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 120,
              child: Image.asset(
                "assets/logo_without_text.png",
                fit: BoxFit.fill,
              ),
            ),
            const SpaceH15(),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.person),
              controller: controller.fNameController,
              hintText: 'FirstName'.tr,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'PleaseEnterFirstName'.tr;
                }
                return null;
              },
              onSaved: (value) {
                controller.userFName.value = value!;
              },
              //obscureText: _isVisible ? false : true,
            ),
            const SpaceH15(),
            CustomTextFormField(
              prefixIcon: Icon(Icons.person),
              controller: controller.lNameController,
              hintText: 'LastName'.tr,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'PleaseEnterYourLastName'.tr;
                }
                return null;
              },
              onSaved: (value) {
                controller.userLName.value = value!;
              },
              //obscureText: _isVisible ? false : true,
            ),
            const SpaceH15(),
            CustomTextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              prefixIcon: const Icon(Icons.phone_enabled),
              controller: controller.phoneController,

              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9,+]')),
               // FilteringTextInputFormatter.digitsOnly

              ],

              hintText: 'MobileNumber'.tr,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'PleaseEnterMobileNumber'.tr;
                } else if (value.length < 11) {
                  return 'PleaseEnterMobileNumber11'.tr;
                }
                return null;
              },
              onSaved: (value) {
                controller.userPhone.value = value!;
              },
              //obscureText: _isVisible ? false : true,
            ),
            const SpaceH15(),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.mail),
              controller: controller.emailController,

              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[a-z,@,.,0-9]')),
                // FilteringTextInputFormatter.digitsOnly

              ],
              hintText: "E-Mail",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'PleaseEnterEmail'.tr;
                }
                return null;
              },
              onSaved: (value) {
                controller.userMail.value = value!;
              },
              //obscureText: _isVisible ? false : true,
            ),
            const SpaceH15(),
            CustomTextFormField(
              obscureText: true,
              prefixIcon: const Icon(Icons.lock),
              controller: controller.passwordController,
              hintText: 'Password'.tr,
              // labelText: "123",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'PleaseEnterPassword'.tr;
                } else if (value.length < 6) {
                  return 'PasswordMustBe6characters'.tr;
                }
                return null;
              },
              onSaved: (value) {
                controller.userPass.value = value!;
              },
              //obscureText: controller.isHidePassword ? false : true,
            ),
            const SpaceH15(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx((){
                 return Checkbox(
                    checkColor: Colors.white,
                    value: controller.isCheckPolicyAgree.value,
                    onChanged: (bool? value) {
                      controller.isCheckPolicyAgree.value = value!;
                    },
                  );
                }),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         Text(
                          'IAgreeToThe'.tr,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF6E6E6E),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            /// policy Click
                          },
                          child:  Text(
                            'PrivacyPolicy'.tr,
                            style: TextStyle(
                              fontSize: 14.0,
                              color:  Color(0xFFD81D4C),
                            ),
                          ),
                        ),
                         Text(
                          'andterms'.tr,
                          style: TextStyle(
                            fontSize: 14.0,
                            color:  Color(0xFF6E6E6E),
                          ),
                        ),
                      ],
                    ),
                     Text(
                      'ConditionsOfLimarket'.tr,
                      style: TextStyle(
                        fontSize: 14.0,
                        color:  Color(0xFF6E6E6E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SpaceH15(),
            _registerBtn(context),
            const SpaceH15(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppStrings.isDoNotAccount,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF6E6E6E),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.AUTHENTICATION);
                  },
                  child: const Text(
                    AppStrings.signIn,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFD81D4C),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _registerBtn(context) {
    return GestureDetector(
      onTap: () {
        if (controller.registerFormKey.currentState!.validate()) {
          controller.registerFormKey.currentState!.save();

          if(controller.isCheckPolicyAgree.value){

              Map<String, dynamic> rgMapBody = {
                'first_name': controller.userFName.value,
                'last_name': controller.userLName.value,
                'email': controller.userMail.value,
                'birth_day': '1/2/2020',
                'customer_mobile': controller.userPhone.value,
                'password': controller.userPass.value,
              };

              if (kDebugMode) {
                print(rgMapBody);
              }

              controller.registerController(rgMapBody: rgMapBody, context: context);
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Select policy and terms and condition',style: TextStyle(color: Colors.red),)));
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
        child: Center(
          child: Text(
            'CreateAccount'.tr,
            style: TextStyle(
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
