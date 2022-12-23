
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';

class CheckOutRepo  {
  @override
  void onInit() {}

  Future getShippingDataListRepo() async {
    print('userId :${user_id.$}');
     Uri   apiUrl = Uri.parse('${ApiURL.getShippingAddressUrl}${user_id.$}') ;
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Get Shipping Address  List API ');
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future updateShippingDataListRepo(updateShippingAddress) async {
    print('userId :${user_id.$}');
    Uri apiUrl = Uri.parse(ApiURL.updateShippingAddressUrl) ;
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.post(apiUrl,body:updateShippingAddress);
      if (kDebugMode) {
        print('Get  Shipping Address  Update  API ');
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future shippingMethodAddressRepo() async {
    print('userId :${user_id.$}');
    Uri apiUrl = Uri.parse(ApiURL.shippingMethodAddressUrl) ;
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.post(apiUrl);
      if (kDebugMode) {
        print('Get  Shipping Address Method   API ');
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Main E-commerce Part Checkout
  Future checkoutPlaceOrderRepo(Map<String, dynamic> checkoutMap) async {
    print('checkoutPlaceOrderRepo');
    print(checkoutMap);

    bool isCheckSuccess= false;
    print('userId :${user_id.$}');
    print('-------------------------------------');
    print(checkoutMap);
    Uri apiUrl = Uri.parse(ApiURL.checkoutUrlPath) ;

    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.post(apiUrl,body: jsonEncode(checkoutMap));
      if (kDebugMode) {
        print('Checkout API ');
        print(response.statusCode);
        print(response.body);
        print(response.body);
      }

      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

}
