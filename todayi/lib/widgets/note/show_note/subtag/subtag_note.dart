import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class SubtagNote extends StatelessWidget {
  List<Widget> cardchild;
  String tagtext;

  SubtagNote({
    super.key, 
    required this.cardchild,
    required this.tagtext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
        EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorLibrary.cardContentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '# $tagtext',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 19),
            ),
          ),
          Column(
            children: cardchild,
          )
          // Container(
          //   padding: EdgeInsets.all(15),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: ColorLibrary.cardSubTagColor,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Text('Builder 오류 해결',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16)),
          // )
        ],
      ));
  }
}
