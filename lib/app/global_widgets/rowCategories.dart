import 'package:flutter/material.dart';

class RowCategories extends StatelessWidget {
  const RowCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.0,
                height: 81.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/headset.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Headphone',
                        style: TextStyle(
                          fontSize: 8.0,
                          color: const Color(0xFF797979),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 80.0,
                height: 81.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/mouse.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'G11 Mouse',
                        style: TextStyle(
                          fontSize: 8.0,
                          color: const Color(0xFF797979),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 80.0,
                height: 81.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/ppc.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Gaming PC',
                        style: TextStyle(
                          fontSize: 8.0,
                          color: const Color(0xFF797979),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
