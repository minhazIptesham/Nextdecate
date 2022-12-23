import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';

class NavCategoriesRepo {
  @override
  void onInit() {}

  Future mainCategoriesRepo() async {
    Uri apiUrl = Uri.parse(ApiURL.homeC1ategoriesUrl) ;
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('Home Main Categories  API ');
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
