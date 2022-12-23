import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/brandList.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../controllers/product_wishlist_controller.dart';

class ProductWishlistView extends GetView<ProductWishlistController> {
  const ProductWishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.black,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.purple,
    ];

    return SafeArea(
      child: Scaffold(
       /* appBar: AppBar(
          title: const Text('ProductWishlistView'),
          centerTitle: true,
        ),*/
        body:   Obx((){
           if(controller.isLoadingGetWishData.value){
             return Text('Wish List Data : ${controller.wishlist[0].toString()}');
           }else{
             return const Center(child: CircularProgressIndicator());
           }
        }),



        /*Column(
          children: [

            CustomAppBarWidget('WishList'),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0.0),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  var show = blist().wishlistname[index];
                  var showbrandicon = blist().wishlisticon[index];
                  return Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              //color: Colors.blue,
                              height: MediaQuery.of(context).size.height,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  "$showbrandicon",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            flex: 4,
                            child: Container(
                              //color: Colors.blue,
                              height: MediaQuery.of(context).size.height,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Power Bank Water Gold Sound Box',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: const Color(0xFF7E7E7E),
                                      height: 1.06,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    '$show',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: const Color(0xFFD81D4C),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          //SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: CustomPaint(
                                painter: Chevron(),
                                child: GestureDetector(
                                  onTap: () {
                                    print('click Wishlist Delete ');

                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (param) {
                                        return AlertDialog(
                                          actions: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, bottom: 8.0),
                                              child: ElevatedButton(
                                                *//*  minWidth: 80.0,
                                                color: const Color(0xFF0A0A5A),*//*
                                                onPressed: () {
                                                  //Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white,
                                                    height: 1.36,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: ElevatedButton(

                                                onPressed: () => Get.back(),

                                                child:   Text(
                                                  'CANCEL',
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white,
                                                    height: 1.36,
                                                  ),
                                                ),
                                               style: ElevatedButton.styleFrom( backgroundColor: Colors.red,),
                                              ),
                                            ),

                                          ],
                                          title: const Text(
                                            'Are you sure you want to delete the selected Products from the cart?',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color:  Color(0xFF1F1F1F),
                                              height: 1.36,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 65.0,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        "assets/delete.png",
                                        fit: BoxFit.cover,
                                        height: 30,
                                        width: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
          ],
        )),*/
      )
    );

  }


}

class Chevron extends CustomPainter {
  final List<Color> colors = [
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.purple,
  ];
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF1EDED),
        Color.fromARGB(255, 247, 238, 238),
      ],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, 0);
    path.lineTo(size.width / 1, size.height - size.height / 12);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

