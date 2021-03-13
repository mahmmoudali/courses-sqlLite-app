import 'package:flutter/material.dart';
import 'package:sql_lite_app/routes.dart';

class BuildTextFromFeild extends StatelessWidget {
  const BuildTextFromFeild({
    Key key,
    this.hint,
    this.label,
    this.icon,
    this.maxLines = 1,
    this.textInputType = TextInputType.name,
    this.onChanged,
    this.controller,
  }) : super(key: key);
  final String hint, label;
  final IconData icon;
  final int maxLines;
  final TextInputType textInputType;
  final Function onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(color: kSec3Color),
        suffixIcon: Icon(
          icon,
          color: kSec3Color,
        ),
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: kSec3Color)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: kSec1Color)),
      ),
    );
  }
}
