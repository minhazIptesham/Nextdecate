import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utiles/api_url.dart';
import '../utiles/local_helper/shared_value_helper.dart';

class NavAccountSettingsRepo {

  Future getProfileRepo() async {

    Map<String, String> headersLogged = {
    'Content-Type': 'application/json',
    "Authorization": "Bearer ${access_token.$}",
  };

    var userId =user_id.$;

     String apiUrl = '${ApiURL.userProfileUrl}user_id=$userId';
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      var response = await http.get(Uri.parse(apiUrl),headers: headersLogged);

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

  /// Country Repo
  Future<bool> updateProfileRepo({required Map userUpdateMapBody}) async {
    print(' userUpdateMapBody : $userUpdateMapBody');
    const String apiUrl = ApiURL.userUpdateProfileUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      var response = await http.post(Uri.parse(apiUrl),
          body: userUpdateMapBody);

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
        print('user Update  $error');
      }
    }
    return false;
  }

  Future getCountryListRepo()async{
    Uri apiUrl=Uri.parse(ApiURL.getCountryUrl);
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
///  state Repo
  Future getStateListByCountryIdRepo(String countryId)async{
       Uri apiUrl=Uri.parse(ApiURL.getStateByCountryIdUrl+countryId);

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
          print('State dropdown  $error');
        }
      }


  }

}
