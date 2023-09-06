// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CollegeChoices extends StatelessWidget {
  CollegeChoices({super.key, required this.college, this.ontap});
  String college;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color.fromARGB(50, 144, 144, 144),
        ),
        width: 333,
        height: 39,
        child: Center(
          child: Text(
            college,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
