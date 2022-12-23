import 'package:flutter/material.dart';

import 'package:get/get.dart';


class Helpers {
  Helpers._();
/*  static ProgressDialog? pr;
  static dynamic loadingDialog(BuildContext context) {
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false, showLogs: true);
    pr!.style(
        message: "Wait for a few seconds ...",
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
          padding: const EdgeInsets.all(10),
          child: const CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.red,),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.fastOutSlowIn,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
        messageTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ));
    return pr;
  }*/

  static BoxDecoration createButtonDecoration({double? radius}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        // border: Border.all(
        //   color: Colors.black26,
        // ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ]);
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static void snackbarForErorr({
    required String titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        backgroundColor: Get.theme.primaryColor,
        colorText: Colors.white);
  }

  static void snackbarForSucess({
    required String titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        backgroundColor: fromHex('#4f8438'),// #65C7AF(old)
        colorText: Colors.white);
  }
}

extension HexColorApp on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension StringToInt on String {
  int parseInt() {
    return int.parse(this);
  }
}

extension FancyNum on num {
  num plus(num other) => this + other;

  num times(num other) => this * other;
}

extension ExtendedString on String {
  bool get isValidName {
    return !this.contains(RegExp(r'[0–9]'));
  }
}


Widget titleText({required String text}) {
  return Text(
    text,
    style: Get.textTheme.titleSmall!
        .copyWith(fontWeight: FontWeight.w400, fontSize: 13),
  );
}

Widget insideBodyText({required String text}) {
  return Text(
    text,
    style: Get.textTheme.bodySmall!
        .copyWith(fontWeight: FontWeight.w200, fontSize: 10),
  );
}
