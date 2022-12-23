
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../data/utiles/app_colors.dart';
import '../modules/bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../routes/app_pages.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  //color: Colors.blue,
                  height: 170,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 35.0, bottom: 30, right: 30, left: 30),
                    child: Image.asset(
                      "assets/headset.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Power Bank Water Gold \nSound Box',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xFF7E7E7E),
                          height: 1.06,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '45000.OOXAF X 1',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: const Color(0xFFB2B2B2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500.00 SAR',
                              style: TextStyle(
                                fontSize: 15.0,
                                color:

                                Theme.of(context).primaryColor,
                                //const Color(0xFFD81D4C),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // Group: Group 348

                            SizedBox(
                              width: 96.0,
                              height: 28.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment(-0.05, -0.2),
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      color: const Color(0xFFF0F0F0),
                                    ),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        color: const Color(0xFF837A7A),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '01',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: const Color(0xFF837A7A),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      color: const Color(0xFFF0F0F0),
                                    ),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: const Color(0xFF837A7A),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            //color: Colors.blue,
            height: 2,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.string(
              // Path 245
              '<svg viewBox="16.5 570.5 381.85 1.0" ><path transform="translate(16.5, 570.5)" d="M 0 0 L 381.8505554199219 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-dasharray="3 4" stroke-miterlimit="4" stroke-linecap="round" /></svg>',
              width: MediaQuery.of(context).size.width,
              height: 1.0,
              color: Colors.blue,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9D9D9D).withOpacity(0.16),
                  offset: Offset(0, 0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 36.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xFFEBEBEB),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: const Color(0xFF989898),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                       onTap: () {
                         Get.toNamed(Routes.CHECKOUT);
                       },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 36.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                          color: CtmColors.appColor),
                        child: Center(
                            child: Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
