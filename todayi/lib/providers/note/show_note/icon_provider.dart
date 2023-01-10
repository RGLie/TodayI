import 'package:flutter/material.dart';

class IconProvider extends ChangeNotifier {
  int _icon = 0;
  int get icon => _icon;
  bool _icon_checked = false;
  bool get icon_checked => _icon_checked;
  bool _icon_clicked = false;
  bool get icon_clicked => _icon_clicked;

  void iconChecked(int n) {
    _icon = n;
    notifyListeners();
  }

  void checked() {
    _icon_checked = true;
    _icon_clicked = false;
    notifyListeners();
  }

  void reset() {
    _icon = 0;
    _icon_checked = false;
    _icon_clicked = false;
    notifyListeners();
  }

  void clickedChecked() {
    _icon_clicked = false;
    notifyListeners();
  }

  void buttonChecked() {
    _icon_clicked = true;
    notifyListeners();
  }
}
