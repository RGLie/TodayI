import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      //height: 100,
      constraints: BoxConstraints(
        maxWidth: 1000,
      ),
      decoration: BoxDecoration(
        color: ColorLibrary.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 5,
            offset: Offset(3, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(
                height: 60,
                width: 60,
                image: AssetImage('assets/icons/write_icon.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text('# Today I',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25
                    )
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Today I 개발일지',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                    )
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}