import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameleven/app/data/utiles/app_strings.dart';
import 'package:gameleven/app/init_first_controller/app_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_value/shared_value.dart';
import 'app/data/utiles/language/app_tr.dart';
import 'app/data/utiles/local_helper/cart_local_store.dart';
import 'app/data/utiles/local_helper/shared_value_helper.dart';
import 'app/routes/app_pages.dart';
late SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();

  if (preferences.getString(AppStrings.onBoardingKey) != AppStrings.valueStop) {
    preferences.setString(AppStrings.onBoardingKey, AppStrings.valueInit);
  }

  await GetStorage.init(DbStrings.db_name);

  access_token.load().then(
        (value) {
      user_id.load();
      is_logged_in.load();
      print('Auth userId >> ${user_id.$}');
      print('is  Logged >> ${is_logged_in.$}');
      avatar_original.load();
      user_name.load();
      user_email.load();
      user_phone.load();
    },
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarIconBrightness:
        Brightness.light, // this will change the brightness of the icons
        statusBarColor: const Color(0xFF18042C) // or any color you want
    ),
  );

  runApp(
      SharedValue.wrapApp(
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          color: const Color(0xFF18042C),
          title: "Nextech Mart ",
          initialBinding: AppBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,

          translationsKeys: AppTranslation.translationsKeys,
          locale: Locale(preferences.getString(AppStrings.languageKey) ?? 'en'),
          fallbackLocale: Locale(preferences.getString(AppStrings.languageKey) ?? 'en'),
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
      ),
  );

}
