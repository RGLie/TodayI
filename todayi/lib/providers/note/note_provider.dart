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

  int _count = 1;
  int get count => _count;
  String _content = '';
  String get content => _content;
  bool _iscode = false;
  bool get iscode => _iscode;
  bool _islink = false;
  bool get islink => _islink;
  bool _isproperty = false;
  bool get isproperty => _isproperty;
  bool _issubtag = false;
  bool get issubtag => _issubtag;
  String _code = '';
  String get code => _code;
  String _language = '';
  String get language => _language;
  String _link = '';
  String get link => _link;
  String _subtag = '';
  String get subtag => _subtag;
  bool _property1 = false;
  bool get property1 => _property1;
  bool _property2 = false;
  bool get property2 => _property2;
  bool _property3 = false;
  bool get property3 => _property3;
  bool _property4 = false;
  bool get property4 => _property4;
  bool _property5 = false;
  bool get property5 => _property5;


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

  void setCount(int num){
    _count = num;
  }
  void plusCount(){
    _count+=1;
  }
  void setIsCode(bool s){
    _iscode = s;
  }
  void setIsLink(bool s){
    _islink = s;
  }
  void setIsProperty(bool s){
    _isproperty = s;
  }
  void setIsSubtag(bool s){
    _issubtag = s;
  }
  void setProperty1(bool s){
    _property1 = s;
  }
  void setProperty2(bool s){
    _property2 = s;
  }
  void setProperty3(bool s){
    _property3 = s;
  }
  void setProperty4(bool s){
    _property4 = s;
  }
  void setProperty5(bool s){
    _property5 = s;
  }
  
}
