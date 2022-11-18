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
      decoration: boxdecoration,
      child: Center(
        child: Text('@ ${text}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20
          ),
        )
      ),
    );
  }
}