import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_textform_field.dart';
import '../../../global_widgets/product_widget.dart';
import '../../../global_widgets/search_product_widget.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            CustomAppBarWidget('Search ',isBackButton: true,),
            _buildSearchInput(),
            SizedBox(height: 10,),
            _buildSearchProductList(),

          ],),
        )



      ),
    );
  }

  _buildSearchInput(){
    return    Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomTextFormField(
        prefixIcon: const Icon(Icons.search),
        controller: controller.searchField,
        hintText: "Search for products ",
        onChange: (value){
          controller.searchValue.value=value!;
          print( ' search : ${controller.searchValue.value}');
          if(value.length>3){
            controller.getSearchProductController();
            print('SearchView._buildSearchInput ${value.toString()}');
          }

        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter your phone number';
          }
          return null;
        },

        onSaved: (value) {
          //controller.password.value = value!;
        },
        //obscureText: _isVisible ? false : true,
      ),
    );
  }

  _buildSearchProductList(){
    return   Obx((){
      if(controller.isLoadingSearchData.value){
        if(controller.searchProductList.isEmpty){
          return CircularProgressIndicator();
        }else{
          return SearchProductListWidget(productList: controller.searchProductList);
        }
      }else{
        return Container(
            height: 400,
            width: double.infinity,
            child: Center(child: Text('Opps !!! product not found !',style: TextStyle(fontWeight: FontWeight.bold),)));

      }
    });
  }
}
