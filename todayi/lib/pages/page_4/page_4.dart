import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('준비중인 기능입니다',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: ColorLibrary.textThemeColor
              ),
            ),
            Text('This page will be updated soon',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: ColorLibrary.textThemeColor
              ),
            ),
            SizedBox(height: 150,)
          ],
        ),
      )
    );
  }
}