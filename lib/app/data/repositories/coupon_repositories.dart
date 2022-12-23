import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';
import '../utiles/local_helper/shared_value_helper.dart';

class CouponRepo {

  Future getCouponListRepo()async{
    Uri apiUrl=Uri.parse(ApiURL.couponListUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try{
      var response =await http.get(apiUrl);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    }catch(error){
      if (kDebugMode) {
        print('user profile  $error');
      }
    }
  }
  /// 100%
  Future applyCouponCodeRepo(String couponCode)async{

    print('userId :${user_id.$}');

    String userId =user_id.$;
     String endUrl='customer_id=$userId&coupon_code=$couponCode';
    Uri apiUrl=Uri.parse(ApiURL.couponApplyUrl+endUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try{
      var response =await http.get(apiUrl);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    }catch(error){
      if (kDebugMode) {
        print('user profile  $error');
      }
    }
  }

}
