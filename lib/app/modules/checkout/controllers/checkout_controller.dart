import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gameleven/app/data/models/checkout_model.dart';
import 'package:gameleven/app/data/utiles/local_helper/cart_local_store.dart';
import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import 'package:gameleven/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/models/coupon_model.dart';
import '../../../data/models/new_productinfo_model.dart';
import '../../../data/models/shipping_address_model.dart';
import '../../../data/models/shipping_method_amount_model.dart';
import '../../../data/repositories/checkout_repo.dart';
import '../../../data/repositories/coupon_repositories.dart';
import '../views/successful_veiew_view.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  BottomNavigationbarController btmController = Get.find();

  final count = 0.obs;

  TextEditingController couponController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController nameLastController = TextEditingController();
  TextEditingController customerShortAddressController =
  TextEditingController();
  TextEditingController customerAddress1Controller = TextEditingController();
  TextEditingController customerMobileController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();
  TextEditingController customerCityController = TextEditingController();
  TextEditingController customerZipController = TextEditingController();
  TextEditingController customerCountryController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  String customer_name = '';
  String customer_short_address = '';
  String customer_address_1 = '';
  String customer_mobile = '';
  String customer_email = '';
  String city = '';
  String zip = '';
  String state = '';
  String country = '';
  String company = '';

  /// coupon msg
  final couponMsg = ''.obs;
  final couponApplyAmount = 0.00.obs;
  var couponAcceptModel= CouponModel().obs;


  final selectShippingMethodById = 0.obs;
  final shippingAmount = 0.00.obs;
  final subTotalAmount = 0.00.obs;
  final totalAmount = 0.00.obs;
  final vatAmount = 0.00.obs;


  final isLoadingDataAddressApi = false.obs;

  final isLoadingDataAddressFirstTimeApi = false.obs;
  final isLoadingDataAmountAddressApi = false.obs;
  final isCheckOutCoupon = false.obs;

  final insideValue = 0;
  final outSideValue = 0;

  final selectPaymentMethodById = 1.obs;

  Rx<ShippingAddressModel> getAddress = ShippingAddressModel().obs;

  Rx<ShippingAddressModel> getFirstAddress = ShippingAddressModel().obs;

  var addressMethodInfo = [].obs;

  @override
  void onInit() {
    getShippingAddress();
    shippingMethodAddressAmount();
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


  @override
  void dispose() {
    // TODO: implement dispose
    couponController.dispose();
    noteController.dispose();
    nameController.dispose();
    customerShortAddressController.dispose();
    customerAddress1Controller.dispose();
    customerMobileController.dispose();
    customerEmailController.dispose();
    customerCityController.dispose();
    customerZipController.dispose();

    super.dispose();
  }

  applyCouponCodeCTR() async {
    var categoriesResponseValue = await CouponRepo().applyCouponCodeRepo(
        couponController.text)
        .onError((error, stackTrace) {
      if (kDebugMode) {
        print('coupon Apply Error  : $error');
        print('coupon  Apply Error : $stackTrace');
      }
    });
    var bodyMap = json.decode(categoriesResponseValue.body);


    if(bodyMap['response'][0]['status']==true){

      CouponModel couponCode= CouponModel.fromJson(bodyMap['response'][0]['couponinfo']);
      couponAcceptModel.value=CouponModel.fromJson(bodyMap['response'][0]['couponinfo']);
      print(couponCode.discountAmount);
      print(couponCode.endDate);
    }else{
      var msg =bodyMap['response'][0]['error'];
      couponMsg.value=bodyMap['response'][0]['error'];
      print(msg);
    }

  }



  void increment() => count.value++;

  getShippingAddress() async {
    print('get Shipping  Address Api Call >>> ');
    isLoadingDataAddressApi.value = false;
    var getShippingAddress = await CheckOutRepo().getShippingDataListRepo();

    var bodyMap = json.decode(getShippingAddress.body);
    if (bodyMap['status'] == "success") {
      print(bodyMap['status']);
      getAddress.value =
          ShippingAddressModel.fromJson(bodyMap['shipping_info']);
      if (kDebugMode) {
        print('address id:${bodyMap['shipping_info']['shiping_info_id']}');
      }
      isLoadingDataAddressApi(true);
    }
  }

  updateShippingAddress() async {
    print(customerEmailController.text);

    if (nameController.text == '') {
      customer_name = getAddress.value.customerName!;
    } else {
      customer_name = nameController.text;
    }

    if (customerShortAddressController.text == '') {
      customer_short_address = getAddress.value.customerShortAddress!;
    } else {
      customer_short_address = customerShortAddressController.text;
    }

    if (customerAddress1Controller.text == '') {
      customer_address_1 = getAddress.value.customerAddress1!;
    } else {
      customer_address_1 = customerAddress1Controller.text;
    }

    if (customerMobileController.text == '') {
      customer_mobile = getAddress.value.customerMobile!;
    } else {
      customer_mobile = customerMobileController.text;
    }
    if (customerEmailController.text == '') {
      customer_email = getAddress.value.customerEmail!;
    } else {
      customer_email = customerEmailController.text;
    }

    if (customerCityController.text == '') {
      city = getAddress.value.city!;
    } else {
      city = customerCityController.text;
    }

    if (customerZipController.text == '') {
      zip = getAddress.value.zip!;
    } else {
      zip = customerZipController.text;
    }

    Map<String, dynamic> updatedMap = {
      'shiping_info_id': getAddress.value.shipingInfoId,
      'customer_id': getAddress.value.customerId,
      'customer_name': customer_name,
      'customer_short_address': customer_short_address,
      'customer_address_1': customer_address_1,
      'customer_mobile': customer_mobile,
      'customer_email': customer_email,
      'city': city,
      'state': state,
      'country': '18',
      'zip': zip,
      'company': 'bdtask',
    };

    print('updateShipping Address : $updatedMap');

    print('get Shipping  Address Api Call >>> ');
    isLoadingDataAddressApi.value = false;
    var response = await CheckOutRepo().updateShippingDataListRepo(updatedMap);

    var bodyMap = json.decode(response.body);
    print('update shipping address :: ${bodyMap.toString()}');
    if (bodyMap['status'] == "success") {
      isLoadingDataAddressApi(true);
      getShippingAddress();
    }
  }

  updateShippingAddressFirstTime() async {

    print(customerEmailController.text);

    if (nameController.text == '') {
      customer_name = getFirstAddress.value.customerName!;
    } else {
      customer_name = nameController.text;
    }

    if (customerShortAddressController.text == '') {
      customer_short_address = getFirstAddress.value.customerShortAddress!;
    } else {
      customer_short_address = customerShortAddressController.text;
    }

    if (customerAddress1Controller.text == '') {
      customer_address_1 = getFirstAddress.value.customerAddress1!;
    } else {
      customer_address_1 = customerAddress1Controller.text;
    }

    if (customerMobileController.text == '') {
      customer_mobile = getFirstAddress.value.customerMobile!;
    } else {
      customer_mobile = customerMobileController.text;
    }
    if (customerEmailController.text == '') {
      customer_email = getFirstAddress.value.customerEmail!;
    } else {
      customer_email = customerEmailController.text;
    }

    if (customerCityController.text == '') {
      city = getFirstAddress.value.city!;
    } else {
      city = customerCityController.text;
    }

    if (customerZipController.text == '') {
      zip = getFirstAddress.value.zip!;
    } else {
      zip = customerZipController.text;
    }
    if (customerCountryController.text == '') {
      country = getFirstAddress.value.country!;
    } else {
      country = customerCountryController.text;
    }
    if (companyController.text == '') {
      company = getFirstAddress.value.company!;
    } else {
      company = companyController.text;
    }


    getFirstAddress.value = ShippingAddressModel(
      firstName: customer_name,
      lastName: '',
      customerAddress1: customer_short_address,
      customerEmail: customer_email,
      customerMobile: customer_mobile,
      city: city,
      state: 'city',
      country: country,
      zip: zip,
      company:  company,

    );

    print('update firstTime ');
    print(jsonEncode(getFirstAddress.value));

  }

  shippingMethodAddressAmount() async {
    print('get Shipping  Method Amount  Api Call >>> ');
    isLoadingDataAmountAddressApi.value = false;
    var shippingMethodResponse = await CheckOutRepo().shippingMethodAddressRepo();

    var bodyMap = json.decode(shippingMethodResponse.body);
    print('Shipping Method >>>');
    print(bodyMap);
      for(var data in bodyMap['deleviry_info']){
        addressMethodInfo.add( ShippingMethodAmountModel.fromJson(data));
      }
      isLoadingDataAmountAddressApi(true);
    //}
  }

  Future<bool> checkoutPlaceOrder() async {
    print('Api Addres Address Id: ${getAddress.value.shipingInfoId}');
    var address;

    if (selectShippingMethodById.value == 0) {
      Get.snackbar('Alert ', 'Please Select your Shippinh Method !');
    } else {

    if (getAddress.value.shipingInfoId == null) {
      address = getFirstAddress.toJson();
    }
    else {
      address = getAddress.toJson();
    }

    List orderCart = [];
    orderCart.clear();

    for (var carts in btmController.productInfoWithQty) {
      orderCart.add(carts.productInfo!.toJson());
    }

    Map placeOrderInsideMapBody = {
      "userId": user_id.$,
      "payment_method": selectShippingMethodById.value,
      "paidStatus": 1,
      "totalAmount": btmController.totalPrice,
      "totalDiscount": 0,
      "serviceCharge": 10,
      "details": noteController.text,
      "shippingBillingStatus": 1, //selectPaymentMethodById.value,
      "cartItems": jsonEncode(orderCart),
      "coupon_code": couponController.text.trim(),
    };

    Map<String, dynamic> placeOrderMapBody = {
      'orderInfo': placeOrderInsideMapBody,
      'shippingInfo': address,
      'billingInfo': address
    };
    print(placeOrderMapBody);

    var resValue =
    await CheckOutRepo().checkoutPlaceOrderRepo(placeOrderMapBody);

    var bodyMap = json.decode(resValue.body);
    print('checkOut >> ${bodyMap.toString()}');
    if (bodyMap['status'] == 'success') {
      return true;
    }
    return false;
  }
    return false;
  }
}
