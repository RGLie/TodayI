import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/utils/colors.dart';

import '../../providers/button_provider.dart';

class HomePageStartButton extends StatelessWidget {
  Color boxColor;
  List<BoxShadow> boxShadows;
  HomePageStartButton({super.key,
    required this.boxColor,
    required this. boxShadows
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 290,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadows,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            width: 150,
            image: AssetImage('assets/icons/write_icon.png'),
          ),
          Text(
            '시작하기',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}