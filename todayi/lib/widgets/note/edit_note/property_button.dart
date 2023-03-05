import 'package:flutter/material.dart';
import 'package:todayi/utils/responsive.dart';

class PropertyButton extends StatelessWidget {
  String text;
  BoxDecoration boxdecoration;

  PropertyButton({super.key,
    required this.text,
    required this.boxdecoration
  });

  @override
  Widget build(BuildContext context) {
    var rsp = Responsive(pageContext: context);
    return Container(
      height: rsp.rspHeight(35),
      padding: EdgeInsets.only(left: rsp.rspWidth(12), right:rsp.rspWidth(12)),
      decoration: boxdecoration,
      child: Center(
        child: Text('@ ${text}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: rsp.rspWidth(15)
          ),
        )
      ),
    );
  }
}