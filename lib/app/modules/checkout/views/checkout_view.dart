import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/product_cart_model.dart';
import 'package:gameleven/app/data/models/shipping_address_model.dart';
import 'package:gameleven/app/data/models/shipping_method_amount_model.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import 'package:gameleven/app/modules/checkout/views/successful_veiew_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../../data/models/new_productinfo_model.dart';
import '../../../data/utiles/api_url.dart';
import '../../../data/utiles/app_colors.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';
import '../../../global_widgets/spaceH10.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_app_drawer.dart';
import '../../../global_widgets/spaceH15.dart';
import '../../../global_widgets/spaceW10.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
//  const CheckoutView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomAppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWidget(
                'CheckOut Information',
                isBackButton: true,
              ),

              /// address 01
              _buildAddress(context),

              /// products 02
              checkOutHeadLine(context, 'Products'),
              const SpaceH10(),
              _productList(context),
              const SpaceH10(),

              ///Shipping Method 03
              checkOutHeadLine(context, 'Shipping Method'),

              const SpaceH10(),
              shippingMethodUI(),

              /// note 04
              const SpaceH10(),
              checkOutHeadLine(context, 'Note'),
              const SpaceH10(),
              _noteInput(),

              /// coupon 05
              const SpaceH10(),
              checkBoxCouponHeadLine(context),
              const SpaceH10(),

              /// order summary 06
              checkOutHeadLine(context, 'Order Summary'),
              const SpaceH10(),
              _orderSummary(controller),

              /// payment method 07
              const SpaceH10(),
              checkOutHeadLine(context, 'Payment Method'),
              _paymentMethod(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomPlaceOrderBtn(context),
      ),
    );
  }

  /// Contact BottomSheet
  _buildBottomSheetContactCheckOut(
      context, ShippingAddressModel getDataShipping) {
    print('Mobile >> ${getDataShipping.customerMobile}');
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headLineText(headName: 'Contact Number *'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: controller.customerMobileController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      border: OutlineInputBorder(),
                      hintText: getDataShipping.customerMobile),
                  // validator: (value){},
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateShippingAddress();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CtmColors.appColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'save address'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      height: 1.36,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  ///  Create Shipping address  BottomSheet First time
  _buildBottomSheetCreateShippingCheckOut(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'First Name*'),
                            _customInputFieldBottomSheet('Enter First Name',
                                inputController: controller.nameController),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Last Name*'),
                            _customInputFieldBottomSheet('Enter Last Name',
                                inputController: controller.nameLastController),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  _headLineText(headName: 'Email'),
                  _customInputFieldBottomSheet('Enter your mail',
                      inputController: controller.customerEmailController),
                  const SpaceH10(),
                  _headLineText(headName: 'Contact Number*'),
                  _customInputFieldBottomSheet('Enter your contact number',
                      inputController: controller.customerMobileController),
                  const SpaceH10(),
                  _headLineText(headName: 'Address*'),
                  _customInputFieldBottomSheet('Enter road no. block/sector',
                      inputController: controller.customerAddress1Controller),
                  const SpaceH10(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Area'),
                            _customInputFieldBottomSheet('Enter Area',
                                inputController: TextEditingController()),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'City*'),
                            _customInputFieldBottomSheet('Enter City',
                                inputController:
                                    controller.customerCityController),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  /*  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Region*'),
                            _customInputFieldBottomSheet('',
                                inputController: TextEditingController()),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Country*'),
                            _customInputFieldBottomSheet('',
                                inputController: controller.customerCountryController),
                          ],
                        ),
                      )
                    ],
                  ),*/
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Zip'),
                            _customInputFieldBottomSheet('Enter ZIP',
                                inputController:
                                    controller.customerZipController),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Country*'),
                            _customInputFieldBottomSheet('Enter Country',
                                inputController:
                                    controller.customerCountryController),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  ElevatedButton(
                    onPressed: () {
                      controller.getFirstAddress.value = ShippingAddressModel(
                        firstName: controller.nameController.value.text,
                        lastName: controller.nameLastController.value.text,
                        customerShortAddress:
                            controller.customerAddress1Controller.value.text,
                        customerEmail:
                            controller.customerEmailController.value.text,
                        customerMobile:
                            controller.customerMobileController.value.text,
                        city: controller.customerCityController.value.text,
                        state: 'state',
                        country:
                            controller.customerCountryController.value.text,
                        zip: controller.customerZipController.value.text,
                        company: controller.companyController.value.text,
                      );

                      print(jsonEncode(
                          controller.getFirstAddress.value.toJson()));
                      controller.isLoadingDataAddressFirstTimeApi(true);
                      //controller.checkoutPlaceOrder1();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CtmColors.appColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Create Shipping address'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        height: 1.36,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Add Shipping Address  BottomSheet
  _buildBottomSheetUpdateAddressCheckOut(
      context, ShippingAddressModel data, CheckoutController controller) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'First Name*'),
                            _customInputFieldBottomSheet(
                                data.firstName.toString(),
                                inputController: controller.nameController),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Last Name*'),
                            _customInputFieldBottomSheet(
                                data.firstName.toString(),
                                inputController: TextEditingController()),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  _headLineText(headName: 'Email'),
                  _customInputFieldBottomSheet(data.customerEmail.toString(),
                      inputController: controller.customerEmailController),
                  const SpaceH10(),
                  _headLineText(headName: 'Contact Number*'),
                  _customInputFieldBottomSheet(data.customerMobile.toString(),
                      inputController: controller.customerMobileController),
                  const SpaceH10(),
                  /*  _headLineText(headName: 'Date of Birth'),
                  InkWell(
                    onTap: () {
                      _selectDateDepart(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Enter your date of Birth',
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),*/
                  const SpaceH10(),
                  // _headLineText(headName: 'Gender'),
                  /*  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Male',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Female',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Others',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),*/
                  const SpaceH10(),
                  _headLineText(headName: 'Address*'),
                  _customInputFieldBottomSheet(
                      data.customerShortAddress.toString(),
                      inputController:
                          controller.customerShortAddressController),
                  const SpaceH10(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'City*'),
                            _customInputFieldBottomSheet(data.city.toString(),
                                inputController:
                                    controller.customerCityController),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'ZIP*'),
                            _customInputFieldBottomSheet(data.zip.toString(),
                                inputController:
                                    controller.customerZipController),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Region*'),
                            _customInputFieldBottomSheet('',
                                inputController: TextEditingController()),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Country*'),
                            _customInputFieldBottomSheet('',
                                inputController: TextEditingController()),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  ElevatedButton(
                    onPressed: () {
                      controller.updateShippingAddress();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CtmColors.appColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Update Address'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        height: 1.36,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Add Shipping Address  BottomSheet Fist Time
  _buildBottomSheetUpdateAddressCheckOutFirstTime(
      context, ShippingAddressModel data, CheckoutController controller) {
    print('update first time ');
    print(data);
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'First Name*'),
                            _customInputFieldBottomSheet(
                                data.firstName.toString(),
                                inputController: controller.nameController),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Last Name*'),
                            _customInputFieldBottomSheet(
                                data.lastName.toString(),
                                inputController: controller.nameLastController),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  _headLineText(headName: 'Email'),
                  _customInputFieldBottomSheet(data.customerEmail.toString(),
                      inputController: controller.customerEmailController),
                  const SpaceH10(),
                  _headLineText(headName: 'Contact Number*'),
                  _customInputFieldBottomSheet(data.customerMobile.toString(),
                      inputController: controller.customerMobileController),
                  const SpaceH10(),
                  /*  _headLineText(headName: 'Date of Birth'),
                  InkWell(
                    onTap: () {
                      _selectDateDepart(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Enter your date of Birth',
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),*/
                  const SpaceH10(),
                  // _headLineText(headName: 'Gender'),
                  /*  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Male',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Female',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Others',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),*/
                  const SpaceH10(),
                  _headLineText(headName: 'Address*'),
                  _customInputFieldBottomSheet(
                      data.customerShortAddress.toString(),
                      inputController:
                          controller.customerShortAddressController),
                  const SpaceH10(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'City*'),
                            _customInputFieldBottomSheet(data.city.toString(),
                                inputController:
                                    controller.customerCityController),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'ZIP*'),
                            _customInputFieldBottomSheet(data.zip.toString(),
                                inputController:
                                    controller.customerZipController),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Region*'),
                            _customInputFieldBottomSheet('',
                                inputController: TextEditingController()),
                          ],
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Country*'),
                            _customInputFieldBottomSheet('',
                                inputController: TextEditingController()),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceH10(),
                  ElevatedButton(
                    onPressed: () {
                      controller.updateShippingAddressFirstTime();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CtmColors.appColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Update Address'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        height: 1.36,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Place Order Payment  BottomSheet
  _buildBottomSheetPlaceOrderPaymentCheckOut(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return Obx(() {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceH10(),
                  /* _headLineText(headName: 'Amount to pay'),

                _customInputFieldBottomSheet('XAF 5000.00'),
                _spaceH10(),*/
                  _headLineText(headName: 'Select Payment Method'),
                  const SpaceH10(),

                  /// Payment Options
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          // color: Colors.grey
                        ),
                        child: ListTile(
                          leading: Radio(
                              value: 1,
                              groupValue:
                                  controller.selectPaymentMethodById.value,
                              onChanged: (int? val) {
                                print('inside $val ');
                                controller.insideValue.toString();
                                controller.selectPaymentMethodById.value = val!;
                                print(controller.selectPaymentMethodById.value);
                              }),
                          title: const Text('Cash On Delivery '),
                          trailing: Image.asset(
                            'assets/cashondelivery.png',
                            height: 30,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          // color: Colors.grey
                        ),
                        child: ListTile(
                          leading: Radio(
                              value: 0,
                              groupValue:
                                  controller.selectPaymentMethodById.value,
                              onChanged: (int? val) {
                                print('outside $val');
                                controller.selectPaymentMethodById.value = val!;
                                print(controller.selectPaymentMethodById.value);
                              }),

                          //Text('Radio'),
                          title: const Text('Online Payment '),
                          trailing: Icon(Icons.attach_money_outlined),
                        ),
                      ),
                    ],
                  ),

                  const SpaceH10(),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CtmColors.appColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'make payment'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        height: 1.36,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  _paymentMethod() {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        /* padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),*/
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* _headLineText(headName: 'Amount to pay'),

                _customInputFieldBottomSheet('XAF 5000.00'),
                _spaceH10(),*/
            //  _headLineText(headName: 'Select Payment Method'),
            const SpaceH10(),

            /// Payment Options
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 40,
                  /* decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    // color: Colors.grey
                  ),*/
                  child: ListTile(
                    leading: Radio(
                        value: 1,
                        groupValue: controller.selectPaymentMethodById.value,
                        onChanged: (int? val) {
                          print('inside $val ');
                          controller.insideValue.toString();
                          controller.selectPaymentMethodById.value = val!;
                          print(controller.selectPaymentMethodById.value);
                        }),
                    title: const Text('Cash On Delivery '),
                    trailing: Image.asset(
                      'assets/cashondelivery.png',
                      height: 30,
                      width: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 40,
                  /* decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    // color: Colors.grey
                  ),*/
                  child: ListTile(
                    leading: Radio(
                        value: 0,
                        groupValue: controller.selectPaymentMethodById.value,
                        onChanged: (int? val) {
                          print('outside $val');
                          controller.selectPaymentMethodById.value = val!;
                          print(controller.selectPaymentMethodById.value);
                        }),

                    //Text('Radio'),
                    title: const Text('Online Payment '),
                    trailing: Icon(Icons.attach_money_outlined),
                  ),
                ),
              ],
            ),

            const SpaceH10(),
            /*ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: CtmColors.appColor,
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                'make payment'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  height: 1.36,
                ),
              ),
            )*/
          ],
        ),
      );
    });
  }

  _customInputFieldBottomSheet(String hintName,
      {required TextEditingController inputController}) {
    return TextFormField(
      //readOnly: true,
      controller: inputController,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: const OutlineInputBorder(),
          hintText: hintName,
          hintStyle: const TextStyle(fontSize: 14)),
      onTap: () {
        /// Save
      },
      //validator: (value){},
    );
  }

  /// Check out Bottom
  _buildBottomPlaceOrderBtn(context) {
    return Container(
      alignment: const Alignment(-0.11, 0.14),
      width: MediaQuery.of(context).size.width,
      height: 90.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9D9D9D).withOpacity(0.16),
            offset: const Offset(0, 0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.12,
        height: 106.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 13),
            /*  SizedBox(
              width: 333.06,
              height: 19.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Items :02',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF5A5A5A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF343434),
                      ),
                      children: [
                        TextSpan(
                          text: 'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' : SAR 50000.00',
                          style: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 16),*/
            GestureDetector(
              onTap: () async {
                print('Firest Address : ${controller.getFirstAddress.toJson()}');
                print('Api Addres Address : ${controller.getAddress.toJson()}');

                final ProgressDialog progressDialog =
                    DBHelper.loadingDialog(Get.overlayContext!);
                progressDialog.show();
                bool isSuccess = await controller.checkoutPlaceOrder();

                if (isSuccess) {
                  progressDialog.hide();
                  Get.off(const SuccessfulViewView());
                } else {
                  progressDialog.hide();
                  Get.snackbar(
                    'Order has not successful...',
                    'try to again please',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    duration: const Duration(seconds: 3),
                  );
                }
                //  _buildBottomSheetPlaceOrderPaymentCheckOut(context);
              },
              child: Container(
                alignment: const Alignment(0.0, -0.08),
                width: MediaQuery.of(context).size.width,
                height: 48.21,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFF18042C)
                    //   CtmColors.appColor

                    ),
                child: const Text(
                  'PLACE ORDER',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 9),
          ],
        ),
      ),
    );
  }

  /// cart Item
  _productList(context) {
    return GetBuilder<BottomNavigationbarController>(builder: (controller) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.productInfoWithQty.length,
          itemBuilder: (BuildContext context, int index) {
            ProductCart cartItems = controller.productInfoWithQty[index];
            print(
                'CartItem Name :${cartItems.productInfo!.cartItemProductId.toString()}');

            return Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${ApiURL.globalUrl}${cartItems.productInfo!.cartProductImage}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          /*  decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${ApiURL.globalUrl}${cartItems.productInfo!.cartProductImage}'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),*/
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItems.productInfo!.cartProductName
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF7E7E7E),
                                  fontWeight: FontWeight.bold,
                                  height: 1.06,
                                ),
                              ),
                              Text(
                                '${cartItems.productInfo!.cartItemProductPrice.toString()} X ${cartItems.productInfo!.cartItemProductQuantity.toString()}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFFB2B2B2),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                ' ৳ ' +
                                    cartItems.productInfo!.cartItemProductPrice
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFFD81D4C),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }

  _orderSummary(CheckoutController checkoutController) {
    return GetBuilder<BottomNavigationbarController>(builder: (controller) {
      if (controller.productInfoWithQty.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  keyValueSummary("Subtotal", " ৳ 00.00"),
                  keyValueSummary("Delivery Charge", " ৳ 00.00"),
                  keyValueSummary("Vat", " ৳ 00.00"),
                  keyValueSummary("Total", " ৳ 00.00"),
                ],
              )),
        );
      } else {

        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child:
              Obx(() {
                checkoutController.subTotalAmount.value = controller.totalPrice;

                print('subTatal :${checkoutController.subTotalAmount.value}');
                print('shipping :${checkoutController.shippingAmount.value}');
                print('vat :${checkoutController.vatAmount.value}');
                print('coupon :${checkoutController.couponAcceptModel.value.discountAmount}');
                print('Grand Amount  :${checkoutController.totalAmount}');

                double subTotal=checkoutController.subTotalAmount.value;
                double shippingCost=checkoutController.shippingAmount.value;
                double vat=checkoutController.vatAmount.value;
                double coupon= 0.00;//double.parse(checkoutController.couponAcceptModel.value.discountAmount.toString());
                double grandAmount=(subTotal+shippingCost+vat)-coupon;

                return Column(
                  children: [
                    keyValueSummary("Subtotal", ' ৳ ${subTotal.toString()}'),
                    keyValueSummary("Delivery Charge", ' ৳ ${shippingCost.toString()}'),
                    keyValueSummary("Vat", " ৳ ${vat.toString()}"),
                    keyValueSummary("Coupon  ", " ৳ ${coupon.toString()}"),
                    keyValueSummary("Total", ' ৳ ${grandAmount.toString()}'),
                  ],
                );
              })),
        );
      }
    });
  }

  _headLineText({required String headName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        headName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  _gender() {
    return Radio(value: '1', groupValue: "Male", onChanged: (value) {});
  }

  Future<void> _selectDateDepart(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    print(picked);
    if (picked != null && picked != selectedDate) {
      //setState(() {
      selectedDate = picked;
      // print('check Date of Birth ');
      //  });
    }
  }

  /// address
  _buildAddress(BuildContext context) {
    return GetX<CheckoutController>(builder: (addressCTR) {
      ShippingAddressModel getShippingData = addressCTR.getAddress.value;
      ShippingAddressModel getShippingDataFrstTime =
          addressCTR.getFirstAddress.value;

      if (addressCTR.isLoadingDataAddressApi.value) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                ///
                // _buildBottomSheetEditCheckOut(context);
              },
              child: checkOutHeadLine(context, 'Billing Address'),
            ),
            Container(
              color: const Color(0xffF5F5F5),
              height: 75,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getShippingData.firstName.toString() +
                              ' ' +
                              getShippingData.lastName.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF525252),
                            height: 1.06,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          getShippingData.customerShortAddress.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF777777),
                            height: 1.21,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        /// Edit Shipping Address
                        _buildBottomSheetUpdateAddressCheckOut(
                            context, getShippingData, addressCTR);
                      },
                      child: Container(
                        width: 31.0,
                        height: 31.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CtmColors.appColor,
                        ),
                        child: const Icon(Icons.edit,
                            color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 29.0,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Contact Number',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF414141),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              color: const Color(0xffF5F5F5),
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getShippingData.customerMobile.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF525252),
                        height: 1.06,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _buildBottomSheetContactCheckOut(
                            context, getShippingData);
                      },
                      child: Container(
                        width: 31.0,
                        height: 31.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CtmColors.appColor,
                        ),
                        child: const Icon(Icons.edit,
                            color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        if (addressCTR.isLoadingDataAddressFirstTimeApi.value) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  ///
                  // _buildBottomSheetEditCheckOut(context);
                },
                child: checkOutHeadLine(context, 'Billing Address'),
              ),
              Container(
                color: const Color(0xffF5F5F5),
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getShippingDataFrstTime.firstName.toString() +
                                ' ' +
                                getShippingDataFrstTime.lastName.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF525252),
                              height: 1.06,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            getShippingDataFrstTime.customerShortAddress
                                .toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF777777),
                              height: 1.21,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            getShippingDataFrstTime.customerEmail.toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF777777),
                              height: 1.21,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            getShippingDataFrstTime.customerMobile.toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF777777),
                              height: 1.21,
                            ),
                          ),
                          /* SizedBox(height: 5),
                          Text(
                            getShippingDataFrstTime.country.toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF777777),
                              height: 1.21,
                            ),
                          ),*/
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          /// Edit Shipping Address First Time
                          _buildBottomSheetUpdateAddressCheckOutFirstTime(
                              context, getShippingDataFrstTime, addressCTR);
                        },
                        child: Container(
                          width: 31.0,
                          height: 31.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CtmColors.appColor,
                          ),
                          child: const Icon(Icons.edit,
                              color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              // height: Get.size.width / 4,
              child: InkWell(
                onTap: () {
                  _buildBottomSheetCreateShippingCheckOut(context);
                },
                child: Container(
                  height: 50,
                  width: 300,
                  color: CtmColors.appColor,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 16,
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            )),
                        SizedBox(width: 10),
                        Text(
                          'Create Address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }
      }
    });
  }

  shippingMethodUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
        height: Get.size.width / 2.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              'Kindly Select the preferred shipping method to use on this order.',
              style: TextStyle(fontWeight: FontWeight.w300),
            )),
            const SpaceH10(),
            const SpaceH10(),
            Obx(() {
              if (controller.addressMethodInfo.isEmpty) {
                return Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: const Text(
                        'Fetch Shipping Method Amount .Wait few seconds',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ));
              } else {
                return
                  Center(
                    child: Container(
                      width: double.infinity,

                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        shrinkWrap: true,
                        primary: true,
                        itemCount: controller.addressMethodInfo.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          ShippingMethodAmountModel data =
                              controller.addressMethodInfo[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(data.name.toString(),style: TextStyle(fontWeight: FontWeight.w300),),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(() {
                                      return Radio(
                                          value: int.parse(data.id.toString()),
                                          groupValue: controller
                                              .selectShippingMethodById.value,
                                          onChanged: (int? val) {
                                            print('inside ${data.id.toString()}');
                                            print('value $val');
                                            controller.shippingAmount.value =
                                                double.parse(
                                                    data.chargeAmount.toString());

                                            controller.selectShippingMethodById
                                                .value = val!;
                                            print(controller
                                                .selectShippingMethodById.value);
                                          });
                                    }),

                                    /*Radio(
                                        value: int.parse(data.id.toString()),
                                        groupValue:
                                            controller.selectShippingMethodById.value,
                                        onChanged: (int? val) {
                                          print('inside ${data.id.toString()}');
                                          print('value $val');
                                          shippingCost = double.parse(
                                              data.chargeAmount.toString());
                                          print('amount : ${data.chargeAmount}');

                                          controller.selectShippingMethodById.value =
                                              val!;
                                          print(controller
                                              .selectShippingMethodById.value);
                                        }),*/
                                    Text(data.chargeAmount.toString()),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    ),
                  );

                /* return   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name.toString()),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: int.parse(data.position.toString()),
                                groupValue:
                                    controller.selectShippingMethodById.value,
                                onChanged: (int? val) {
                                  print('inside $val ');
                                  controller.selectShippingMethodById.value =
                                      val!;
                                  print(controller
                                      .selectShippingMethodById.value);
                                }),
                            Text(data.chargeAmount.toString()),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data1.name.toString()),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value:  int.parse(data1.position.toString()),
                                groupValue:
                                    controller.selectShippingMethodById.value,
                                onChanged: (int? val) {
                                  print('outside $val');
                                  controller.selectShippingMethodById.value =
                                      val!;
                                  print(controller
                                      .selectShippingMethodById.value);
                                }),
                            Text(data1.chargeAmount.toString()),
                          ],
                        ),
                      ],
                    ),
                  ],
                );*/
              }
            })
          ],
        ),
      ),
    );
  }

  checkOutHeadLine(context, headLineText) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 35.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          headLineText,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF414141),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  _noteInput() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      alignment: Alignment.centerLeft,
      width: Get.size.width,
      height: 80.0,
      color: Colors.white,
      child: TextFormField(
        maxLines: 2,
        controller: controller.noteController,
        decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border: OutlineInputBorder(),
            hintText: 'Comments '),
        onTap: () {},
        // validator: (value){},
      ),
    );
  }

  checkBoxCouponHeadLine(context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('Use Coupon Code '),
            trailing: Obx(() {
              return Checkbox(
                value: controller.isCheckOutCoupon.value,
                onChanged: (val) {
                  controller.isCheckOutCoupon.value = val!;
                },
              );
            }),
          ),
        ),
        const SpaceH10(),
        Obx(() {
          if (controller.isCheckOutCoupon.value) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 80.0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    /*  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,*/
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.couponController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              border: OutlineInputBorder(),
                              hintText: 'Code here'),
                          onTap: () {},
                          // validator: (value){},
                        ),
                      ),
                      const SpaceW10(),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (controller.couponController.text == '') {
                              Get.snackbar('Alert', 'Code here plz');
                            } else {
                              await controller.applyCouponCodeCTR();
                              if (controller.couponMsg =='') {
                                Get.snackbar(
                                    'Coupon', 'Your Code has been accepted');
                              } else {
                                Get.snackbar(
                                    'Alert', controller.couponMsg.toString());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CtmColors.appColor,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text(
                            'Apply Coupon',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          } else {
            return Container();
          }
        })
      ],
    );
    // });
  }

  /// order Summary key value

  keyValueSummary(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              key,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                ' : $value',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF7E7E7E),
                ),
              )),
        ],
      ),
    );
  }
}
