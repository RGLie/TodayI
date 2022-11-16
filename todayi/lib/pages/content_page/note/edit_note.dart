import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('노트 에디터',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        SizedBox(height: 15),
        Container(
          color: Colors.black12,
          width: double.infinity,
          height: 1,
        ),
        SizedBox(height: 15),
        Text('내용 추가하기',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: ColorLibrary.cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 3,
                    offset: Offset(2, 2), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('개발',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black45)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('코드 추가',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
