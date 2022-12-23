import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';

class NavHomeRepo {
  @override
  void onInit() {}

  Future sliderRepo() async {
    Uri apiUrl = Uri.parse(ApiURL.homeSliderUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Slider API ');
        print(response.statusCode);
      //  print(response.body);
      }
      return   response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('slider  error >>> $error');
      throw Exception(error);
    }
  }

  Future homeBestSaleRepo() async {
    Uri apiUrl = Uri.parse( ApiURL.homeBestSaleUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('BEST SALE API ');
        print(response.statusCode);
       // print(response.body);
      }

      return  json.decode(response.body);
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('best sale error >>> $error');
      throw Exception(error);
    }
  }

  Future homeAllProductRepo() async {
    Uri apiUrl = Uri.parse( ApiURL.homeAllProductUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('All Product API ');
        print(response.statusCode);
        // print(response.body);
      }

      return  json.decode(response.body);
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('best sale error >>> $error');
      throw Exception(error);
    }
  }

  Future homeHotCategoriesRepo() async {
    Uri apiUrl = Uri.parse( ApiURL.homeHotCategoriesUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Home Hot Categories  API ');
        print(response.statusCode);
       // print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('category error >>> $error');
      throw Exception(error);
    }
  }

  /// Sub Categories
  Future homeSubCategoriesRepo(categoryId) async {
    print('Testing CategoryId :${categoryId}');

    /// id pass
    Uri apiUrl = Uri.parse( ApiURL.homeSubCategoryChildByIdUrl+categoryId);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Home Hot Categories  API ');
        print(response.statusCode);
        // print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('category error >>> $error');
      throw Exception(error);
    }
  }

  Future homeBrandListRepo() async {
    Uri apiUrl = Uri.parse( ApiURL.homeBrandListUrl);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Home Brand List API ');
        print(response.statusCode);
      //  print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('home brand error >>> $error');
      throw Exception(error);
    }
  }

  /// Brand Wise product
  Future homeBrandWiseProductRepo(String brandId) async {
    Uri apiUrl = Uri.parse(ApiURL.homeBrandWiseProductListUrl+brandId);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Home Brand Wise product  List API ');
        print(response.statusCode);
          print(response.body);
      }
      return json.decode(response.body);
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('home brand error >>> $error');
      throw Exception(error);
    }
  }


  /// Search Product
  Future searchProductRepo(String charValue) async {
    Uri apiUrl = Uri.parse( ApiURL.productSearchUrl+charValue);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Product Search API ');
        print(response.statusCode);
         print(response.body);
      }

      return  response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('best sale error >>> $error');
      throw Exception(error);
    }
  }

}
