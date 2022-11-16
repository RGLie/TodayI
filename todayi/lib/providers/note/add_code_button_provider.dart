import 'package:flutter/material.dart';

class AddCodeButtonProvider extends ChangeNotifier {
  int _mouse_state = 0;
  int _is_clicked = 0;
  int get mouse_state => _mouse_state;
  int get is_clicked => _is_clicked;
  //is mouse region : 1
  //button clicked : 2
  //else : 0
  void clicked() {
    _mouse_state = 2;
    _is_clicked = (_is_clicked + 1) % 2;
    notifyListeners();
  }

  void isRegion() {
    _mouse_state = 1;
    notifyListeners();
  }

  void isnRegion() {
    _mouse_state = 0;
    notifyListeners();
  }
}
