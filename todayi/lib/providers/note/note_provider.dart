import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  int _checked_tag = 0;
  bool _is_checked = false;
  int get checked_tag => _checked_tag;
  bool get is_checked => _is_checked;

  List<bool> _is_hide = [];

  void checked() {
    _is_checked = !_is_checked;
    notifyListeners();
  }

  void checkedTagIdx(int i) {
    _checked_tag = i;
    notifyListeners();
  }

  void setNumIdx(int n) {
    for (int i = 0; i < n; i++) {
      _is_hide.add(true);
    }
    notifyListeners();
  }

  bool getHide(int idx) {
    return _is_hide[idx];
  }

  void changeHide(int idx) {
    _is_hide[idx] = !_is_hide[idx];
    notifyListeners();
  }
}
