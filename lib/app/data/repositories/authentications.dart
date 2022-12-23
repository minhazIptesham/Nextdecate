import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';
import '../utiles/local_helper/shared_value_helper.dart';

class Authentication {
  @override
  void onInit() {}

  Future loginRepo({required String phone, required String password}) async {
    const String apiUrl = ApiURL.loginUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    Map<String, dynamic> bodyData = {
      'customer_mobile': phone,
      'password': password
    };

    print('login bodyData >> $bodyData');

    try {
      var response = await http.post(Uri.parse(apiUrl), body: bodyData);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
  }

  Future<bool> registerRepo({required Map rgMapBody}) async {
    print(' rgMapBody $rgMapBody');
    const String apiUrl = ApiURL.registerUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      var response = await http.post(Uri.parse(apiUrl), body: rgMapBody);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    return false;
  }

  Future<bool> changePasswordRepo({required oldPass, required newPass}) async {
    print(' changePass oldPass $oldPass');
    print(' changePass newPass $newPass');
    print('userId :${user_id.$}');
    String apiUrl = ApiURL.changePasswordUrl +
        'user_id=${user_id.$}&old_password=$oldPass&new_password=$newPass&confirm_password=$newPass';
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      var response = await http.get(Uri.parse(apiUrl));
       var mapBody= jsonDecode(response.body);
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
        print(mapBody['status']);
      }

      if (mapBody['status'] == 'error') {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      if (kDebugMode) {
        print('change password  $error');
      }
    }
    return false;
  }

  Future<bool> contactUsRepo({required fName, required lName,required email,required message,}) async {
    print('fName $fName');
    print('lName $lName');
    print('email $email');
    print('message $message');
    String apiUrl = '${ApiURL.contactUsUrl}first_name=$fName&last_name=$lName&email=$email&message=$message';
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      var response = await http.get(Uri.parse(apiUrl));
      var mapBody= jsonDecode(response.body);
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
        print(mapBody['status']);
      }

      if (mapBody['status'] == 'error') {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Contact US   $error');
      }
    }
    return false;
  }
}
