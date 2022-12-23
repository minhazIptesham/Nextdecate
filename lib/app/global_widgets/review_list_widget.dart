import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gameleven/app/data/models/product_card_model.dart';
import 'package:gameleven/app/data/models/product_related_model.dart';
import 'package:gameleven/app/data/models/review_model.dart';
import 'package:gameleven/app/data/utiles/api_url.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';
import 'package:get/get.dart';

import '../data/brandList.dart';
import '../data/models/new_productinfo_model.dart';
import '../modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../modules/product_details/controllers/product_details_controller.dart';
import '../routes/app_pages.dart';

class ReviewListWidget extends StatelessWidget {
  var reviewList;
  ReviewListWidget({Key? key, this.reviewList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productDetails = Get.put(ProductDetailsController());

    return Container(

      color: Colors.grey.shade200,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),

          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: reviewList.length,
          itemBuilder: (BuildContext context, int index){

            ReviewModel reviewInfo= reviewList[index];
            print(reviewInfo.rate.toString());

            return Container(
              height: Get.width/3,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  CircleAvatar(
                          radius: 20,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                )),
                          ),
                        ),),
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(reviewInfo.reviewerName.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Icon(Icons.watch_later_outlined,size: 15,),
                                  SizedBox(width: 2,),
                                  Text(reviewInfo.createdAt.toString(),style: TextStyle(fontStyle: FontStyle.italic, fontWeight:FontWeight.w500,fontSize: 8)),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Row(

                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Icon(Icons.star, color: Colors.red, size: 18),
                                Text('(${reviewInfo.rate.toString()})')
                                /*Icon(Icons.star, color: Colors.red, size: 10),
                                Icon(Icons.star, color: Colors.red, size: 10),
                                Icon(Icons.star, color: Colors.red, size: 10),
                                Icon(Icons.star, color: Colors.red, size: 10),*/
                              ],
                            ),
                          )),
                    ],),
                  SizedBox(height: 5,),
                  Divider(height: 0.5,thickness: 0.1,color: Colors.black,),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(reviewInfo.comments.toString(),style: TextStyle(fontWeight: FontWeight.w400),),
                  ))
                ],),

            );
          })

    );


  }
}
