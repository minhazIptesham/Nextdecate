import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/state_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/country_model.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../data/repositories/nav_account_settings_reposities.dart';
import '../../../data/utiles/local_helper/shared_value_helper.dart';

class UpdateProfileController extends GetxController {
  //TODO: Implement UpdateProfileController
  XFile? imagePick;
  final count = 0.obs;
  Rx<bool> isLoadingGetProfileData = false.obs;

  Rx<bool> isLoadingGetCountryData = false.obs;
  Rx<bool> isLoadingGetStateData = false.obs;

  TextEditingController  firstNameCTR = TextEditingController();
  TextEditingController  lastNameCTR = TextEditingController();
  TextEditingController  emailCTR = TextEditingController();
  TextEditingController  contactCTR = TextEditingController();
  TextEditingController  regionCTR = TextEditingController();
  TextEditingController  zipCTR = TextEditingController();
  TextEditingController  cityCTR = TextEditingController();
  TextEditingController  address1CTR = TextEditingController();
  TextEditingController  address2CTR = TextEditingController();


   String userId='';
  String fullName='';
  String firstName='';
  String lastName='';
  String email='';
  String address_1='';
  String address_2='';
  String city='';
  String state='';
  String country='';
  String zip='';
  String mobile='';
  String company='';



  var profileInfo = [].obs;

  var countryList = [].obs;
  var countryInitValue= ''.obs;
  var stateInitValue= ''.obs;
  var stateList = [].obs;

  @override
  void onInit() {
    getProfileInfo();
    getCountryListController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getProfileInfo()async{

    print('get profile Api Call >>> ');
    isLoadingGetProfileData.value=false;
    var profile= await NavAccountSettingsRepo().getProfileRepo();

    var bodyMap = json.decode(profile.body);
    if(bodyMap['status']=="success"){
      if (bodyMap['user_info'] != null) {
        for (var profiles in bodyMap['user_info']) {
          profileInfo.add(UserProfileModel.fromJson(profiles));
        }
        if (kDebugMode) {
        }
        isLoadingGetProfileData.value=true;
      }
    }
    isLoadingGetProfileData.value=true;
  }

  dynamic userUpdateController({required BuildContext context}) async {
    print('First Name :${firstNameCTR.text}');
    UserProfileModel data= profileInfo[0];
    print('data:${data.firstName}');

    if(firstNameCTR.text==''){
      firstName=data.firstName.toString();
    }else{
      firstName= firstNameCTR.text;
    }

    if(lastNameCTR.text==''){
      lastName=data.lastName.toString();
    }else{
      lastName= lastNameCTR.text;
    }

    if(emailCTR.text==''){
      email=data.email.toString();
    }else{
      email= emailCTR.text;
    }

    if(address1CTR.text==''){
      address_1=data.address1.toString();
    }else{
      address_1= address1CTR.text;
    }
    if(address2CTR.text==''){
      address_2=data.address2.toString();
    }else{
      address_2= address2CTR.text;
    }

    if(zipCTR.text==''){
      zip=data.zip.toString();
    }else{
      zip= zipCTR.text;
    }
    if(contactCTR.text==''){
      mobile=data.mobile.toString();
    }else{
      mobile= contactCTR.text;
    }

    if(cityCTR.text==''){
      city=data.city.toString();
    }else{
      city= cityCTR.text;
    }

    Map<String ,dynamic> userUpdateMap ={
      'user_id': data.customerId,
      'full_name':data.firstName,
      'first_name':firstName,
      'last_name':lastName,
      'email':email,
      'address_1':address_1,
      'address_2':address_2,
      'city':city,
      'state': stateInitValue.value==''? data.state:stateInitValue.value,
      'country':  countryInitValue.value==''? data.country:countryInitValue.value,
      'zip':zip,
      'mobile':mobile,
      'company':'bdtask',
    };

    print(userUpdateMap);

   try {
      NavAccountSettingsRepo()
          .updateProfileRepo(userUpdateMapBody: userUpdateMap)
          .timeout(const Duration(seconds: 500))
          .then((value) {
        if (value) {
          profileInfo.clear();
          getProfileInfo();
          print('User Profile  has  updated');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Profile update is successful!')));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Profile update is Wrong!')));
        }
      }).onError((error, stackTrace) => null);
    } catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Profile update is Wrong!')));
      if (kDebugMode) {
        print('UpdateProfileController.userUpdateController $e');
      }
    }
  }

  ///Country CTR
  getCountryListController()async{

    print('get Country Api Call >>> ');
    isLoadingGetCountryData.value=false;
    var countries= await NavAccountSettingsRepo().getCountryListRepo();
    var bodyMap = json.decode(countries.body);
    print('bodyMap Country name ${bodyMap['country_info'][0]['name']}');

      if (bodyMap['country_info'] != null) {
        for (var data in bodyMap['country_info']) {
          countryList.add(CountryModel.fromJson(data));
        }
        isLoadingGetCountryData.value=true;
      }
    print('country lng >>> ${countryList.length}');
  }

  /// State CTR
  getStateByCountryIdController()async{
    stateList.clear();
    print('get State Api Call >>> ');
    isLoadingGetStateData.value=false;
    var stateList1= await NavAccountSettingsRepo().getStateListByCountryIdRepo(countryInitValue.value);
    var bodyMap = json.decode(stateList1.body);
      if (bodyMap['state_info'] != null) {
        for (var state in bodyMap['state_info']) {
          stateList.add(StateModel.fromJson(state));
        }
        isLoadingGetStateData.value=true;
      }
    isLoadingGetStateData.value=true;
  }
}
