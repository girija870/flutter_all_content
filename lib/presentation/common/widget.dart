import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  AsyncSnapshot snapshot;
  String labelText;
  String? errorText;
  TextInputType keyboardType;

  CustomTextFormField(
      {required this.controller,
      required this.hintText,
      required this.snapshot,
      required this.labelText,
      required this.errorText,
      required this.keyboardType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText, labelText: labelText, errorText: errorText),
    );
  }
}
