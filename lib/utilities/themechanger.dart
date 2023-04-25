import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool isDarkModeon = false;

  void updateTheme(bool isDarkModeon) {
    this.isDarkModeon = isDarkModeon;
    notifyListeners();
  }
}
