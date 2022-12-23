import 'package:flutter/material.dart';

import '../data/utiles/api_url.dart';

class CategoriesWidget extends StatelessWidget {
  var categoriesImage;
  var categoryName;

  CategoriesWidget({Key? key, this.categoriesImage,this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffE1E1E1),
      ),
      width: MediaQuery.of(context).size.width,

      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 72.0,
                  height: 72.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${ApiURL.globalUrl}${categoriesImage}'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                categoryName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: const Color(0xFF797979),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
