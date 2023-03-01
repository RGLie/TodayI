import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/utils/responsive.dart';

class QuoteWidget extends StatelessWidget {
  String quotation;
  String person;

  QuoteWidget({super.key, required this.quotation, required this.person});

  @override
  Widget build(BuildContext context) {
    var rsp = Responsive(pageContext: context);
    
    return Container(
      width: rsp.rspWidth(930),
      child: Column(
        children: [
          Container(
            color: ColorLibrary.textThemeColor,
            height: rsp.rspHeight(2),
            width: rsp.rspWidth(260),
          ),
          SizedBox(
            height: rsp.rspHeight(35),
          ),
          Text(
            quotation,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: rsp.rspWidth(30),
                color: ColorLibrary.textThemeColor,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: rsp.rspHeight(15),
          ),
          Text(
            '- ${person} -',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: rsp.rspWidth(25),
              color: ColorLibrary.textThemeColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: rsp.rspHeight(15),
          ),
          Container(
            color: ColorLibrary.textThemeColor,
            height: rsp.rspHeight(2),
            width: rsp.rspWidth(260),
          ),
        ],
      ),
    );
  }
}
