import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class AddContentButton extends StatelessWidget {
  String subtxt;
  String txt;
  String imgpath;
  BoxDecoration boxdecoration;
  AddContentButton({
    super.key,
    required this.txt,
    required this.subtxt,
    required this.imgpath,
    required this.boxdecoration
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11),
      height: 110,
      width: 110,
      decoration: boxdecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtxt,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.black45)),
          SizedBox(
            height: 5,
          ),
          Text(txt,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                height: 35,
                width: 35,
                image: AssetImage(imgpath),
              ),
            ],
          )
        ],
      ),
    );
  }
}
