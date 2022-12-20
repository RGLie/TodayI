import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todayi/data/tag.dart';

class NoteProvider extends ChangeNotifier {
  int _checked_tag = 0;
  bool _is_checked = false;
  int get checked_tag => _checked_tag;
  bool get is_checked => _is_checked;

  String _today_date = DateFormat('yyyy.MM.dd.').format(DateTime.now());
  String get today_date => _today_date;
  //_is_hide number of index could make some index error
  List<bool> _is_hide = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  List<Tag> _tag_list = [];
  List<Tag> get tag_list => _tag_list;
  void changeDate(String d) {
    _checked_tag = 0;
    _is_checked = false;
    _is_hide = [];
    _tag_list = [];
    _today_date = d;
    notifyListeners();
  }

  void addTag(Tag tag) {
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

  Tag getChekcedTag() {
    if(_is_checked){
      return _tag_list[_checked_tag];
    }
    return Tag(uid: '', username: '', tagname: '', createdate: '', description: '', icon: '', issubtag: false, subtaglist: [], isdate: false, datelist: []);
  }
}
