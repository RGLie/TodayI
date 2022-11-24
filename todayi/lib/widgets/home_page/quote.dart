import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class QuoteWidget extends StatelessWidget {
  String quotation;
  String person;

  QuoteWidget({super.key, required this.quotation, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 930,
      child: Column(
        children: [
          Container(
            color: ColorLibrary.textThemeColor,
            height: 2,
            width: 260,
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            quotation,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: ColorLibrary.textThemeColor,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '- ${person} -',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: ColorLibrary.textThemeColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            color: ColorLibrary.textThemeColor,
            height: 2,
            width: 260,
          ),
        ],
      ),
    );
  }
}
