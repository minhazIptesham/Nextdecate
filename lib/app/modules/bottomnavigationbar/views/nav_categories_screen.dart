import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/sub_category_model.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import 'package:gameleven/app/modules/bottomnavigationbar/views/subcategorywiseproduct_view.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../data/models/main_categories_model.dart';
import '../../../data/utiles/api_url.dart';
import '../../../data/utiles/app_colors.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/categories.dart';


class NavCategoriesScreen extends StatelessWidget {
  const NavCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarWidget('Categories'.tr),
            _mainCategories(context),
          ],
        ),
      ),
    );
  }

  _mainCategories(BuildContext context) {
    return GetX<BottomNavigationbarController>(
      builder: (mainCategories) {
        if(mainCategories.categories.isEmpty){
              return  const Center(child:  Text ('Categories Not Found !'));
        }
        return  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
          Expanded(
              flex: 1,
              child:  ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: mainCategories.categories.length,
              itemBuilder: (BuildContext ctx,int idx){
                //mainCategories.categories[idx].isSelectActive=false;
                MainCategoriesModel categories=mainCategories.categories[idx];
                print('isSelect ${categories.isSelectActive}');
                      return InkWell(
                  onTap: (){

                    final ProgressDialog progressDialog = DBHelper.loadingDialog(Get.overlayContext!);
                    progressDialog.show();

                    Timer(Duration(seconds: 2), () { // <-- Delay here
                      progressDialog.hide();
                    });

                    if(categories.isSelectActive==false){
                      mainCategories.categories[idx].isSelectActive=true;
                    }else{
                      mainCategories.categories[idx].isSelectActive=false;
                    }

                    mainCategories.homeSubCategoriesCTR(categories.categoryId);
                    
                      },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 2),

                               decoration:
                               mainCategories.categories[idx].isSelectActive?
                               BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color:  CtmColors.appColor,


                                   ): BoxDecoration(
                                 borderRadius: BorderRadius.circular(0),

                               ),
                              child: CategoriesWidget(categoriesImage: categories.image,categoryName:categories.name)),
                        ),
                      ),


                    ],
                  ),
                );

              })),
        mainCategories.subCategories.isEmpty? Expanded(
            flex: 3,
            child: Center(child: Text('Sub Category not found !'))):
          Expanded(
              flex: 3,

              child: ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: mainCategories.subCategories.length,
                  itemBuilder: (BuildContext context, int index){
                   SubCategoryModel  subCategoryInfo= mainCategories.subCategories[index];



                    return InkWell(
                      onTap: (){
                        print(' sub Category Id >>${subCategoryInfo.categoryId}');

                              Get.to(SubcategorywiseproductView(mainCategories));
                         /// Sub Category Wise Product
                      },
                      child: Card(
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListTile(
                                leading: Image.network('${ApiURL.globalUrl}${subCategoryInfo.catImage}',fit: BoxFit.cover,),
                                title: Text(subCategoryInfo.categoryName.toString()),
                                trailing: Icon(Icons.arrow_forward_ios),
                              )

                              /*Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width ,
                                      //color: Colors.blue,
                                      child: Image.network('${ApiURL.globalUrl}${subCategoryInfo.catImage}',fit: BoxFit.fitWidth,),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(subCategoryInfo.categoryName.toString(),
                                      style:  TextStyle(
                                        fontSize: 12.0,
                                        color: CtmColors.appColor,
                                        //const Color(0xFF021E65),
                                        fontWeight: FontWeight.bold,
                                        height: 1.42,
                                      ),
                                    ),
                                  ),

                                ],
                              ),*/
                            ),
                          ),
                        ),
                    );


                  })
        ),
             //  ProductListWidget(productList: mainCategories.subCategories,)),
]
        );
      }
    );
  }
}
