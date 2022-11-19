import 'package:flutter/material.dart';

class PropertyProvider extends ChangeNotifier {
  //A: 잘함
  //B: 배움
  //C: 개선
  //D: 어려움
  //E: 계획
  
  int _typeA_mouse_state = 0;
  int _is_typeA_clicked = 0;
  int get typeA_mouse_state => _typeA_mouse_state;
  int get is_typeA_clicked => _is_typeA_clicked;

  int _typeB_mouse_state = 0;
  int _is_typeB_clicked = 0;
  int get typeB_mouse_state => _typeB_mouse_state;
  int get is_typeB_clicked => _is_typeB_clicked;

  int _typeC_mouse_state = 0;
  int _is_typeC_clicked = 0;
  int get typeC_mouse_state => _typeC_mouse_state;
  int get is_typeC_clicked => _is_typeC_clicked;

  int _typeD_mouse_state = 0;
  int _is_typeD_clicked = 0;
  int get typeD_mouse_state => _typeD_mouse_state;
  int get is_typeD_clicked => _is_typeD_clicked;

  int _typeE_mouse_state = 0;
  int _is_typeE_clicked = 0;
  int get typeE_mouse_state => _typeE_mouse_state;
  int get is_typeE_clicked => _is_typeE_clicked;
  //is mouse region : 1
  //button clicked : 2
  //else : 0
  void typeAClicked() {
    _is_typeA_clicked = (_is_typeA_clicked + 1) % 2;
    notifyListeners();
  }

  void istypeARegion() {
    _typeA_mouse_state = 1;
    notifyListeners();
  }

  void isntypeARegion() {
    _typeA_mouse_state = 0;
    notifyListeners();
  }


  void typeBClicked() {
    _is_typeB_clicked = (_is_typeB_clicked + 1) % 2;
    notifyListeners();
  }

  void istypeBRegion() {
    _typeB_mouse_state = 1;
    notifyListeners();
  }

  void isntypeBRegion() {
    _typeB_mouse_state = 0;
    notifyListeners();
  }


  void typeCClicked() {
    _is_typeC_clicked = (_is_typeC_clicked + 1) % 2;
    notifyListeners();
  }

  void istypeCRegion() {
    _typeC_mouse_state = 1;
    notifyListeners();
  }

  void isntypeCRegion() {
    _typeC_mouse_state = 0;
    notifyListeners();
  }


  void typeDClicked() {
    _is_typeD_clicked = (_is_typeD_clicked + 1) % 2;
    notifyListeners();
  }

  void istypeDRegion() {
    _typeD_mouse_state = 1;
    notifyListeners();
  }

  void isntypeDRegion() {
    _typeD_mouse_state = 0;
    notifyListeners();
  }

  void typeEClicked() {
    _is_typeE_clicked = (_is_typeE_clicked + 1) % 2;
    notifyListeners();
  }

  void istypeERegion() {
    _typeE_mouse_state = 1;
    notifyListeners();
  }

  void isntypeERegion() {
    _typeE_mouse_state = 0;
    notifyListeners();
  }
}
