import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _selectedItemIndex = 2;

  int get selectedItemIndex => _selectedItemIndex;

  void setSelectedItemIndex(int index) {
    _selectedItemIndex = index;
    notifyListeners();
  }
}
