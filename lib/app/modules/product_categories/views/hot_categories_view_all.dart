

import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/hot_categories_model.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import 'package:get/get.dart';

import '../../../data/models/main_categories_model.dart';

class CategoriesViewAll extends StatelessWidget {
  const CategoriesViewAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('CategoryViewAll'.tr),
        centerTitle: true,
      ),
      body:categories(context),
    );
  }
  categories(BuildContext context) {
    return GetX<BottomNavigationbarController>(
        builder: (mainCategories) {

          if(mainCategories.hotCategories.isEmpty){
            return   Center(child:  Text ('CategoriesNotFound'.tr));
          }

          return  GridView.builder(
              physics: ScrollPhysics(),
              itemCount: mainCategories.hotCategories.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext ctx,int idx){
                HotCategoriesModel categories=mainCategories.hotCategories[idx];
                return   Container(
                  width: 100,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(left: 8, right: 6),

                        height: 80,
                        child: Image.network(
                          'https://soft29.bdtask.com/nextdecade/${categories.catImage}',fit: BoxFit.cover,),
                      ),
                      SizedBox(height: 2,),
                      Container(
                        width:200,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD81D4C),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(right: 6, left: 8),
                        height: 30,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories.categoryName.toString(),
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      )

                    ],
                  ),
                );

              });
        }
    );
  }
}
