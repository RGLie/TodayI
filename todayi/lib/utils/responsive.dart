import 'package:flutter/material.dart';

class Responsive{
  BuildContext pageContext;
  double webWidth = 1920;
  double webHeight = 1080;

  Responsive({
    required this.pageContext
  });

  void setWebSize(double x, double y){
    webWidth = x;
    webHeight = y;
  }

  double rspHeight(double x){
    return MediaQuery.of(pageContext).size.height * (x/1080);
  }
  double rspWidth(double x){
    return MediaQuery.of(pageContext).size.width * (x/1920);
  }
  double ratioHeight(double r){
    return MediaQuery.of(pageContext).size.height * r;
  }
  double ratioWidth(double r){
    return MediaQuery.of(pageContext).size.width * r;
  }

}