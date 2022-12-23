import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';
import '../utiles/local_helper/shared_value_helper.dart';

class OrderRepo {
  Future getOrderListRepo() async {
    Map<String, String> headersLogged = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${access_token.$}",
    };

    var userId = user_id.$;

    String apiUrl = '${ApiURL.getOrderUrl}$userId';
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      var response = await http.get(Uri.parse(apiUrl), headers: headersLogged);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      return response;
    } catch (error) {
      if (kDebugMode) {
        print('user profile  $error');
      }
    }
  }

  Future getOrderDetailsListRepo(String orderId) async {
    Map<String, String> headersLogged = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${access_token.$}",
    };

    String apiUrl = '${ApiURL.getOrderDetailsUrl}$orderId';
    if (kDebugMode) {
      print(apiUrl);
      print('OrderId :$orderId');
    }

    try {
      var response = await http.get(Uri.parse(apiUrl), headers: headersLogged);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      return response;
    } catch (error) {
      if (kDebugMode) {
        print('user profile  $error');
      }
    }
  }

  Future createReviewRepo(String pId, String comments, String rating) async {
    Map<String, String> headersLogged = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${access_token.$}",
    };
    String userId = user_id.$;
    String apiUrl =
        '${ApiURL.createReviewUrl}product_id=$pId&user_id=$userId&comments=$comments &rate=$rating';
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      var response = await http.get(Uri.parse(apiUrl), headers: headersLogged);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      return response;
    } catch (error) {
      if (kDebugMode) {
        print('user profile  $error');
      }
    }
  }
}
