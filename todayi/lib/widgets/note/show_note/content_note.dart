import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class ContentNote extends StatelessWidget {
  String content;
  
  ContentNote({super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorLibrary.cardContentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(content,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17)),
        ),
      ],
    );
  }
}


