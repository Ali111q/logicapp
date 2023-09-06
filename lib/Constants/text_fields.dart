// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {super.key, this.textFieldController, required this.labeltext});
  final textFieldController;
  final String? labeltext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints(maxHeight: 49, maxWidth: 373),
        labelStyle: TextStyle(fontSize: 14),
        labelText: labeltext,
        // "                                                                                      البريد الالكتروني",
        // hintText: "أدخل بريدك الالكتروني",
        fillColor: Color.fromARGB(255, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
