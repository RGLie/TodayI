import 'package:flutter/material.dart';

class PropertyButton extends StatelessWidget {
  String text;
  BoxDecoration boxdecoration;

  PropertyButton({super.key,
    required this.text,
    required this.boxdecoration
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.only(left: 12, right:12),
      decoration: boxdecoration,
      child: Center(
        child: Text('@ ${text}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15
          ),
        )
      ),
    );
  }
}