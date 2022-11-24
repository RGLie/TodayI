import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:todayi/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: MarkdownBody(
            onTapLink: (text, href, title) {
              href != null ? launchUrl( Uri.parse(href)) : null;
            },
            selectable: true,
            data: content,
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 17
              ),
              h4: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),
              h3: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 22
              ),
              h2: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 25
              ),
              h1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 28
              ),
              
            ),
          ),
          // child: Text(content,
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.w500,
          //         fontSize: 17)),
        ),
      ],
    );
  }
}


