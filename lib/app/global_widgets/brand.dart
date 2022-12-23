import 'package:flutter/material.dart';

class BrandList extends StatelessWidget {
  String brandName;
  String? brandicon;
  BrandList({Key? key, this.brandicon, required this.brandName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 7),
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 240, 240),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                child: Image.asset("$brandicon"),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "$brandName",
                      style: TextStyle(color: Colors.white),
                    ),
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
