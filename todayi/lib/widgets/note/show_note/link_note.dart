
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorLibrary.cardContentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(content,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17)),
              Material(
                color: ColorLibrary.cardContentColor,
                child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      launchUrl(
                        Uri.parse(link),
                      );
                    },
                    icon: Icon(
                      Icons.link,
                      color: Colors.brown,
                    )),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}