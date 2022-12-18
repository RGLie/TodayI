import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todayi/data/note.dart';

class NoteProvider extends ChangeNotifier {
  int _checked_tag = 0;
  bool _is_checked = false;
  int get checked_tag => _checked_tag;
  bool get is_checked => _is_checked;

  String _today_date = DateFormat('yyyy.MM.dd.').format(DateTime.now());
  String get today_date => _today_date;
  //_is_hide number of index could make some index error
  List<bool> _is_hide = [true,true,true,true,true,true,true,true,true,true,true,true,];
  List<Note> _tag_list = [];
  List<Note> get tag_list => _tag_list;
  void changeDate(String d) {
    _is_hide = [];
    _tag_list = [];
    _today_date = d;
    notifyListeners();
  }

  void addTag(Note tag) {
    _tag_list.add(tag);
    notifyListeners();
  }

  void checked() {
    _is_checked = !_is_checked;
    notifyListeners();
  }

  void checkedTagIdx(int i) {
    _checked_tag = i;
    notifyListeners();
  }

  // void setNumIdx(int n) {
  //   // _checked_tag = 0;
  //   // _is_checked = false;
  //   // _is_hide = [];
  //   for (int i = 0; i < n; i++) {
  //     _is_hide.add(true);
  //   }
  //   notifyListeners();
  // }

  bool getHide(int idx) {
    return _is_hide[idx];
  }

  void changeHide(int idx) {
    _is_hide[idx] = !_is_hide[idx];
    notifyListeners();
  }
}
