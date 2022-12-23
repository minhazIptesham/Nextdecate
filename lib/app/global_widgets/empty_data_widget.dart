
import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {

  String emptyData='';


   EmptyDataWidget(this.emptyData);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        margin: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 10),
        width: double.infinity,
        color: Colors.white,
        child:  Center(
            child: Text(emptyData,
              style: TextStyle(
                  fontWeight: FontWeight.w500),
            )));
  }
}
