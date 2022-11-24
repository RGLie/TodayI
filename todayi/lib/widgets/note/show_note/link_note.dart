
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:todayi/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkNote extends StatelessWidget {
  String content;
  String link;

  LinkNote({super.key,
    required this.content,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(left:15, right:15, bottom:15, top: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorLibrary.cardContentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  //splashRadius: 20,
                  onPressed: () {
                    launchUrl(
                      Uri.parse(link),
                    );
                  },
                  icon: Icon(
                    Icons.link,
                    color: Colors.brown,
                  )),
              MarkdownBody(
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
            ],
          ),
        ),
        
      ],
    );
  }
}