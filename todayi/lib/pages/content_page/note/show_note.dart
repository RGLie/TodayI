import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todayi/utils/colors.dart';

class ShowNote extends StatefulWidget {
  const ShowNote({super.key});

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              width: 70,
              image: AssetImage('assets/icons/calendar_icon.png'),
            ),
            SizedBox(
              width: 30,
            ),
            Text(DateFormat('yyyy년 MM월 dd일').format(DateTime.now()),
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600, color: Colors.black)),
            SizedBox(
              width: 30,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          color: ColorLibrary.textThemeColor,
          width: double.infinity,
          height: 4,
        ),
      ],
    );
  }
}