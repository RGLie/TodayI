import 'package:flutter/material.dart';

class SideBarProvider extends ChangeNotifier {
  int _side_bar_index = 0;
  int get side_bar_index => _side_bar_index;

  void changeIndex(int idx){
    _side_bar_index = idx;
    notifyListeners();
  }


}