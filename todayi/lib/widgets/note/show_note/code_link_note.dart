import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:todayi/utils/code_element.dart';
import 'package:todayi/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CodeLinkNote extends StatelessWidget {
  String content;
  String code;
  String language;
  String link;
  Color cardcolor;

  CodeLinkNote({
    super.key,
    required this.content,
    required this.code,
    required this.link,
    this.language='dart',
    this.cardcolor = const Color(0xffE5DDD1)
  });

  @override
  Widget build(BuildContext context) {
    String codeblock = '```$language\n$code```';
    
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only( top: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: MarkdownBody(
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
                      // code: TextStyle(
                      //   backgroundColor: Colors.black,
                      //   color: Colors.white,
                      //   fontSize: 16
              
                      // )
                    ),
                    key: const Key("defaultmarkdownformatter"),
                    builders: {
                      'code': CodeElementBuilder(),
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 5),
                  color: Color(0xff32363b),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('dart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Icon(
                            Icons.content_copy_outlined,
                            color: Colors.white,
                            size: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              MarkdownBody(
                  onTapLink: (text, href, title) {
                    href != null ? launchUrl(Uri.parse(href)) : null;
                  },
                  selectable: true,
                  data: codeblock,
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
                    // code: TextStyle(
                    //   backgroundColor: Colors.black,
                    //   color: Colors.white,
                    //   fontSize: 16
              
                    // )
                  ),
                  key: const Key("defaultmarkdownformatter"),
                  builders: {
                    'code': CodeElementBuilder(),
                  }
                ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse(link),
                        );
                      },
                      icon: Icon(
                        Icons.link,
                        color: ColorLibrary.textThemeColor,
                        size: 22,
                      )
                    ),
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
