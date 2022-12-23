import 'package:flutter/material.dart';

class Categories3 extends StatelessWidget {
  var categoriesname3;
  List<Widget> children;
  Categories3({Key? key, this.categoriesname3, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //height: 60,
      width: MediaQuery.of(context).size.width,
      child: ExpansionTile(
        title: Text(
          categoriesname3,
          style: TextStyle(
            fontSize: 13.0,
            color: const Color(0xFF797979),
          ),
        ),
        children: children,
      ),
    );
  }
}
