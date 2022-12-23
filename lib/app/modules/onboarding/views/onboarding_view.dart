import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../data/utiles/app_strings.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          image: Image.asset(
            onBoardDataList[0].image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          titleWidget: Text(
            onBoardDataList[0].titleText,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          bodyWidget:
          Text(
            onBoardDataList[0].bodyText,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),

          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset(
            onBoardDataList[1].image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          titleWidget: Text(
            onBoardDataList[1].titleText,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
         bodyWidget:  Text(
           onBoardDataList[1].bodyText,
           style: TextStyle(fontSize: 12, color: Colors.black),
         ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset(
            onBoardDataList[2].image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          titleWidget: Text(
            onBoardDataList[2].titleText,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        bodyWidget:  Text(
          onBoardDataList[2].bodyText,
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () async {
        preferences = await SharedPreferences.getInstance();
        await preferences.setString(AppStrings.onBoardingKey, AppStrings.valueStop);

        Get.offNamed(Routes.BOTTOMNAVIGATIONBAR);
      },
      onSkip: (){
        Get.offNamed(Routes.BOTTOMNAVIGATIONBAR);
      },
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      rtl: false, // Display as right-to-left
      back: const Icon(
        Icons.arrow_back,
        color: Colors.red,
      ),
      skip:  Text('Skip'.tr,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.red,
          )),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.red,
      ),
      done:  Text('Done'.tr,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.green)),




      curve: Curves.easeIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.green,
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class OnBoardingModel {
  String titleText;
  String bodyText;
  String image;

  OnBoardingModel(
      {required this.titleText, required this.bodyText, required this.image});
}

List<OnBoardingModel> onBoardDataList = [
  OnBoardingModel(
      titleText: 'onBoardingTitle[0]'.tr,
      bodyText: 'onBoardingBody[0]'.tr,
      image: 'assets/gameleven1.png'),
  OnBoardingModel(
      titleText: 'onBoardingTitle[1]'.tr,
      bodyText: 'onBoardingBody[1]'.tr,
      image: 'assets/gameleven2.png'),
  OnBoardingModel(
      titleText: 'onBoardingTitle[2]'.tr,
      bodyText: 'onBoardingBody[2]'.tr,
      image: 'assets/gameleven2.png'),
];
