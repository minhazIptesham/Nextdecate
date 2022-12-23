import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utiles/api_url.dart';

class ProductDetailsInfoRepo  {
  @override
  void onInit() {}

  Future productDetailsBYIdRepo(String pId) async {
    print('pId ## ${pId}');
     Uri apiUrl =Uri.parse( 'https://soft29.bdtask.com/nextdecade/app_v2/product_info?product_id=$pId');

    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Product Details  API ');
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

  Future productDetailsRelatedBYIdRepo(String pId,String pCategoryId) async {
    print('pId ## ${pId}');
    print('pCategoryId ## ${pCategoryId}');

    Uri apiUrl =Uri.parse( 'https://soft29.bdtask.com/nextdecade/app_v2/related_product?category_id=${pCategoryId}&product_id=${pId}');
    print(apiUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Product Details Related  API ');
        print(response.statusCode);
        //print(response.body);

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

  Future reviewListBYProductIdRepo(String pId) async {
    print('pId : $pId');
    Uri apiUrl =Uri.parse(ApiURL.getReviewList+pId);  //77144835 ${pId}
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Product Review   API ');
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
}
