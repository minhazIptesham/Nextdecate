import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameleven/app/data/utiles/app_strings.dart';
import 'package:gameleven/app/global_widgets/customAppBarWidget.dart';

import 'package:get/get.dart';

import '../../../data/utiles/app_colors.dart';
import '../../../global_widgets/custom_text_field_widget.dart';
import '../../../global_widgets/custom_textform_field.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../../global_widgets/spaceH30.dart';
import '../../../routes/app_pages.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          physics: const ScrollPhysics(),
          child: _buildLoginForm(context),
        ),
      ),
    );
  }

  _buildLoginForm(context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          CustomAppBarWidget(AppStrings.signIn),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 120.0,
                  child: Image.asset(
                    "assets/logo_without_text.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SpaceH15(),
                const SpaceH30(),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.phone_enabled),
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  inputFormat: [
                FilteringTextInputFormatter.allow(RegExp('[0-9,+]')),
          // FilteringTextInputFormatter.digitsOnly

        ],
                  hintText: "Phone Number",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                     controller.password.value = value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  controller: controller.passwordController,
                  hintText: "Password ",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    }else if (value.length < 6) {
                      return 'Password must be 6 digit or more';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.password.value = value!;
                  },
                  //obscureText: _isVisible ? false : true,
                ),
                const SpaceH15(),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppStrings.isForgetUPass,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
                const SpaceH30(),
                _buildLoginBtn(context),
                SizedBox(height: MediaQuery.of(context).size.height / 65),
                _buildSocialAuth(context),
                const SpaceH30(),
                SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 33.95,
                        width: 33.95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          AppStrings.fbImg,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        height: 33.95,
                        width: 33.95,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 81, 172, 246),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            AppStrings.googleImg,
                            fit: BoxFit.fitHeight,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 33.95,
                        width: 33.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/instagram.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        height: 33.95,
                        width: 33.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/linkedin.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SpaceH30(),
                const Text(
                  AppStrings.isAgreePolicy,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xFF9A9A9A),
                  ),
                ),
              ],
            ),
          ),
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
                  Get.toNamed(Routes.REGISTER);
                },
                child: const Text(
                  AppStrings.signUp,
                  style: TextStyle(
                    fontSize: 14.0,
                    color:
                    Color(0xFFD81D4C),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildSocialAuth(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: const Color(0xFF9A9A9A),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(
            AppStrings.or,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Color(0xFF9A9A9A),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: const Color(0xFF9A9A9A),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }

  _buildLoginBtn(context) {
    return InkWell(
      onTap: () {
        if (controller.loginFormKey.currentState!.validate()) {
          controller.loginFormKey.currentState!.save();

          ///AuthHelper().setUserData(loginResponse);
           /// todo list 80%
          controller.loginController(context: context);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 58.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: CtmColors.appColor,
        ),
        child: const Center(
          child: Text(
          AppStrings.signIn,
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
