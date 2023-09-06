// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Kbutton extends StatelessWidget {
  const Kbutton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {  
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff0E4F8B),
      ),
      width: 373,
      height: 49,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
