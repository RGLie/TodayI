import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/utils/responsive.dart';

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
    var rsp = Responsive(pageContext: context);
    
    return Container(
      padding: EdgeInsets.all(11),
      //height: rsp.rspHeight(110),
      width: rsp.rspWidth(110),
      decoration: boxdecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtxt,
              style: TextStyle(
                  fontSize: rsp.rspWidth(13),
                  fontWeight: FontWeight.w700,
                  color: Colors.black45)),
          SizedBox(
            height: rsp.rspHeight(5),
          ),
          Text(txt,
              style: TextStyle(
                  fontSize: rsp.rspWidth(17),
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          SizedBox(
            height: rsp.rspHeight(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                height: rsp.rspHeight(35),
                width: rsp.rspWidth(35),
                image: AssetImage(imgpath),
              ),
            ],
          )
        ],
      ),
    );
  }
}
