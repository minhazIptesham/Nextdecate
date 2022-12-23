import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../models/product_cart_model.dart';
import '../../models/user_info_model.dart';

class DBHelper {
  static DBHelper object = DBHelper._();

  DBHelper._();

  static ProgressDialog? pr;

  static dynamic loadingDialog(BuildContext context) {
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false, showLogs: true);
    pr!.style(
        message: "Wait for a few seconds ...",
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
          padding: const EdgeInsets.all(10),
          child:  CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: CtmColors.appColor,
          ),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.fastOutSlowIn,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
        messageTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ));
    return pr;
  }

  init() async {
    print('store  init local ');
    await GetStorage.init(DbStrings.db_name);
  }

  List<ProductCart> getTheCartList() {
    print('store ');
    try {
      GetStorage db = GetStorage(DbStrings.db_name);
      var cartList = db.read(DbStrings.cart_key) ?? [];
      List<ProductCart> resultList = [];

      print('lng : ${cartList.length}');

      for (var json in cartList) {
        resultList.add(ProductCart.fromJson(json));
      }
      print('local Cart Store lng : ${resultList.length}');
      print('local Cart Store lng : ${resultList.length}');

      return resultList;
    } catch (exception) {
      print('db cached exception = $exception');
      return <ProductCart>[];
    }
  }

  void updateCartList(List cartList) async {
    print('cart Local Store Update >>');
    print('local store update product size  : ${cartList.length.toString()}');
    GetStorage db = GetStorage(DbStrings.db_name);
    await db.write(DbStrings.cart_key, cartList);
    await db.save();
  }

  /// Local Login Save
  Future<bool> setUserData(loginResponse) async {
    print('userId >>> ${loginResponse['user_id']}');
    print('auth_status >>> ${loginResponse['auth_status']}');

    //var is_logged_in = loginResponse['auth_status'];
    var userId = loginResponse['user_id'];
    print('first Added userId >> ');
    var token = loginResponse['token'];

    is_logged_in.$ = true;
    is_logged_in.save();

    user_id.$ = userId;
    user_id.save();

    access_token.$ = token;
    access_token.save();

    print('Local Store UserId With Is Logged ');
    print('${is_logged_in.$}');
    print('${user_id.$}');


    return true;
  }

  /// Local login clear
  clearUserData() {
    is_logged_in.$ = false;
    is_logged_in.save();
    access_token.$ = "";
    access_token.save();
    user_id.$ = '';
    user_id.save();
    user_name.$ = "";
    user_name.save();
    user_name.$ = "";
    user_name.save();
    user_phone.$ = "";
    user_phone.save();
    avatar_original.$ = "";
    avatar_original.save();
  }
}

class DbStrings {
  static const db_name = 'CardDb';
  static const cart_key = 'cart_key';
//static const user_name_key = 'user_name_key';
}
