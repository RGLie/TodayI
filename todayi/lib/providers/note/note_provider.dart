import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  List<bool> _is_hide = [];

  void setIdx(int n) {
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
