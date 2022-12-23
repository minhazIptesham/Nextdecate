import 'package:flutter/material.dart';

class CategoriesPadding extends StatelessWidget {
  const CategoriesPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 198, 193, 193),
      ),
    );
  }
}
