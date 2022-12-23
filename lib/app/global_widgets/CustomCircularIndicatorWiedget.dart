import 'package:flutter/material.dart';

class CustomCircularIndicatorWiedget extends StatelessWidget {
  const CustomCircularIndicatorWiedget({super.key, required this.heightMulti});
  final double heightMulti;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightMulti,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
