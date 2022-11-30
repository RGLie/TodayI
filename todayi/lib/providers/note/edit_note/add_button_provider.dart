import 'package:flutter/material.dart';

class AddButtonProvider extends ChangeNotifier {
  int _code_mouse_state = 0;
  int _is_code_clicked = 0;
  int get code_mouse_state => _code_mouse_state;
  int get is_code_clicked => _is_code_clicked;

  int _link_mouse_state = 0;
  int _is_link_clicked = 0;
  int get link_mouse_state => _link_mouse_state;
  int get is_link_clicked => _is_link_clicked;

  int _property_mouse_state = 0;
  int _is_property_clicked = 0;
  int get property_mouse_state => _property_mouse_state;
  int get is_property_clicked => _is_property_clicked;

  int _tag_mouse_state = 0;
  int _is_tag_clicked = 0;
  int get tag_mouse_state => _tag_mouse_state;
  int get is_tag_clicked => _is_tag_clicked;

  int _enter_mouse_state = 0;
  int _is_enter_clicked = 0;
  int get enter_mouse_state => _enter_mouse_state;
  int get is_enter_clicked => _is_enter_clicked;

  //is mouse region : 1
  //button clicked : 2
  //else : 0
  void codeClicked() {
    _is_code_clicked = (_is_code_clicked + 1) % 2;
    notifyListeners();
  }

  void isCodeRegion() {
    _code_mouse_state = 1;
    notifyListeners();
  }

  void isnCodeRegion() {
    _code_mouse_state = 0;
    notifyListeners();
  }


  void linkClicked() {
    _is_link_clicked = (_is_link_clicked + 1) % 2;
    notifyListeners();
  }

  void isLinkRegion() {
    _link_mouse_state = 1;
    notifyListeners();
  }

  void isnLinkRegion() {
    _link_mouse_state = 0;
    notifyListeners();
  }


  void propertyClicked() {
    _is_property_clicked = (_is_property_clicked + 1) % 2;
    notifyListeners();
  }

  void isPropertyRegion() {
    _property_mouse_state = 1;
    notifyListeners();
  }

  void isnPropertyRegion() {
    _property_mouse_state = 0;
    notifyListeners();
  }


  void tagClicked() {
    _is_tag_clicked = (_is_tag_clicked + 1) % 2;
    notifyListeners();
  }

  void isTagRegion() {
    _tag_mouse_state = 1;
    notifyListeners();
  }

  void isnTagRegion() {
    _tag_mouse_state = 0;
    notifyListeners();
  }

  void enterClicked() {
    _is_enter_clicked = (_is_enter_clicked + 1) % 2;
    notifyListeners();
  }

  void isEnterRegion() {
    _enter_mouse_state = 1;
    notifyListeners();
  }

  void isnEnterRegion() {
    _enter_mouse_state = 0;
    notifyListeners();
  }
}




