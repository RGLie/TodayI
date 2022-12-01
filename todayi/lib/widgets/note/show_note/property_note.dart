import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:todayi/utils/code_element.dart';
import 'package:todayi/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyNote extends StatelessWidget {
  String content;
  bool property1;
  bool property2;
  bool property3;
  bool property4;
  bool property5;
  Color cardcolor;

  PropertyNote({
    super.key,
    required this.content,
    this.property1 = false,
    this.property2 = false,
    this.property3 = false,
    this.property4 = false,
    this.property5 = false,
    this.cardcolor = const Color(0xffE5DDD1)
  });

  @override
  Widget build(BuildContext context) {
    String txt = '';

    if (property1) {
      txt = txt + '@ 잘함   ';
    }
    if (property2) {
      txt = txt + '@ 배움   ';
    }
    if (property3) {
      txt = txt + '@ 개선   ';
    }
    if (property4) {
      txt = txt + '@ 아쉬움   ';
    }
    if (property5) {
      txt = txt + '@ 계획   ';
    }

    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MarkdownBody(
                onTapLink: (text, href, title) {
                  href != null ? launchUrl(Uri.parse(href)) : null;
                },
                selectable: true,
                data: content,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                  h4: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  h3: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                  h2: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                  h1: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 28),
                ),
                key: const Key("defaultmarkdownformatter"),
                builders: {
                  'code': CodeElementBuilder(),
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    txt,
                    style: TextStyle(
                        color: ColorLibrary.textThemeColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.content_copy_outlined,
                            color: ColorLibrary.textThemeColor,
                            size: 18,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_outline,
                            color: ColorLibrary.textThemeColor,
                            size: 22,
                          )),
                    ],
                  ),
                ],
              ),
            ],
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
