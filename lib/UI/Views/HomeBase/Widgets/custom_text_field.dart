import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController controller,
  Icon icon,
) {
  return TextFormField(
      controller: controller,
      cursorColor: Colors.green,
      //  style: CustomTextStyle.textField(),
      decoration: InputDecoration(
        hintText: 'hintText',
        fillColor: Colors.white.withOpacity(0.20),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.7),
            borderSide: const BorderSide(width: 0.0, style: BorderStyle.none)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.7),
            borderSide: const BorderSide(width: 0.0, style: BorderStyle.none)),
        contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        prefixIcon: Padding(
            padding: const EdgeInsets.only(
                right: 15.0, left: 15, top: 15, bottom: 15),
            child: icon),
      ));
}
