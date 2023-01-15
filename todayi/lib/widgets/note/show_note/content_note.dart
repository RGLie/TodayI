import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todayi/utils/code_element.dart';
import 'package:todayi/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentNote extends StatelessWidget {
  String content;
  Color cardcolor;
  int count;

  ContentNote({
    super.key,
    required this.content,
    required this.count,
    this.cardcolor = const Color(0xffE5DDD1)
  });

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text:content));
                        Fluttertoast.showToast(msg: '복사되었습니다.',
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          webBgColor: "linear-gradient(to right, #3A2000, #3A2000)",
                          webPosition: 'center',
                          
                          fontSize: 20.0,
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT
                        );
                      },
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
