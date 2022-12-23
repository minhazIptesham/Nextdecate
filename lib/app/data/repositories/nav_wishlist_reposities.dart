import 'package:flutter/foundation.dart';

import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';

class NavWishListRepo  {

  Future getWishListRepo()async{
    print('***************************');

    print('UserId >> ${user_id.$}');

    Uri apiUrl=Uri.parse('${ApiURL.getWishesUrl}?user_id=${user_id.$}');
    if (kDebugMode) {
      print('Get Wish Repo');
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

  Future addWishListRepo(String productId)async{
    String userId=user_id.$;
    print(' userId $userId');
    print(' productId $productId');


    Uri apiUrl=Uri.parse('${ApiURL.addWishesUrl}?user_id=$userId&product_id=$productId');
    if (kDebugMode) {
      print('Add Wish Repo');
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

  Future removeWishListRepo(String wishId)async{
    Uri apiUrl=Uri.parse('${ApiURL.removeWishesUrl}?wishlist_id=$wishId');
    if (kDebugMode) {
      print(apiUrl);
      print('Remove Wish Repo');
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
