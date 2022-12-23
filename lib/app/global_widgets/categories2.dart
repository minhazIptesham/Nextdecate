import 'package:flutter/material.dart';

class Categories2 extends StatelessWidget {
  var categoriesName2;
  Categories2({Key? key, this.categoriesName2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffF8F8F8),
        //color: Colors.blue,
        child: Text(
          categoriesName2,
          style: TextStyle(
            fontSize: 14.0,
            color: const Color(0xFF797979),
          ),
        ),
      ),
    );
  }
}
