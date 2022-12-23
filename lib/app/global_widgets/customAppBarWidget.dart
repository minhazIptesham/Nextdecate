
import 'package:flutter/material.dart';
import 'package:gameleven/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CustomAppBarWidget extends StatelessWidget {
 String appBarTitle;
 bool isBackButton = false;

 CustomAppBarWidget(this.appBarTitle, { this.isBackButton=false});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.grey[100],
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isBackButton?
          IconButton(
              onPressed: () {
                   Get.toNamed(Routes.BOTTOMNAVIGATIONBAR);
              },
              icon: const Icon(Icons.arrow_back_rounded)):Container(margin: EdgeInsets.only(left: 10),),
          Text(appBarTitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF414141),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
