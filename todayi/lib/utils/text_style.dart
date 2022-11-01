import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todayi/utils/colors.dart';

class mainText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overFlow; // elpsis = ...

  mainText({Key? key, this.color=const Color(0xff3A2000), required this.text, this.size=20, this.overFlow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      //style: GoogleFonts.NotoSans() ,
      //style: TextStyle(color: color, fontSize: size, fontWeight: FontWeight.w400),
    );
  }
}