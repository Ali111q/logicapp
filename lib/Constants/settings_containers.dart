import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsContainers extends StatelessWidget {
  SettingsContainers(
      {super.key,
      required this.text,
      this.icon2,
      required this.svgPicture,
      this.width2,
      this.color,
      this.onTap});
  final String text;
  final icon2;
  final svgPicture;
  final width2;
  final color;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 41,
        width: 378.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: icon2,
            ),
            SizedBox(
              width: width2,
            ),
            Text(
              text,
              style: TextStyle(
                  color: color, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            svgPicture,
          ],
        ),
      ),
    );
  }
}
