import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/utiles/app_strings.dart';

class SelectLangaugeController extends GetxController {

  final count = 0.obs;

  final isSelectLanguage = 0.obs;

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


  /// Language Change
  selectLanguageTr(String languageCode)async{
    late SharedPreferences preferences;
    preferences = await SharedPreferences.getInstance();
    Locale loc= Locale(languageCode);
    Get.updateLocale(loc);
    preferences.setString(AppStrings.languageKey, languageCode);
  }

  void increment() => count.value++;
}
