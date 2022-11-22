import 'package:flutter/material.dart';

class CardNoteButtonProvider extends ChangeNotifier {
  bool _is_hide = true;
  bool get is_hide => _is_hide;

  void changeHide() {
    _is_hide = !is_hide;
    notifyListeners();
  }
}
