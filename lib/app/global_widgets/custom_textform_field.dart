
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/utiles/theme_helper.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Function(String?)? onSaved;
  final Function(String?)? onChange;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormat;

  final Widget? suffixIcon;
  final Widget? label;
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.maxLine,
    this.validator,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.onSaved,
    this.inputFormat,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: ThemeHelper().inputBoxDecorationShaddow(),
      child: TextFormField(
        maxLines: maxLine??1,
        obscuringCharacter: '#',
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        inputFormatters: inputFormat,
        onSaved: onSaved,
        decoration: ThemeHelper()
            .textInputDecoration(hintText!,'',prefixIcon),
        onChanged: onChange,

      ),
    );
  }
}
