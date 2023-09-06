import 'package:flutter/material.dart';

class AccountCenterProvider with ChangeNotifier {
  String _imageAsset = 'assets/frame.png';
  double _width = 74;
  double _height = 72.5;

  String get imageAsset => _imageAsset;
  double get width => _width;
  double get height => _height;

  void updateCenterWidget(String imageAsset, double width, double height) {
    _imageAsset = imageAsset;
    _width = width;
    _height = height;
    notifyListeners();
  }
}
