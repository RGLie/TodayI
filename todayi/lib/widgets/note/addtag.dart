import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/utils/colors.dart';

class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  @override
  Widget build(BuildContext context) {
    var user_data = Provider.of<TUser>(context);
    List<Widget> addTagWidgetList = [];
    for (var i = 0; i < min(user_data.taglist.length, 5); i++) {
      addTagWidgetList.add(SizedBox(width: 10));
      addTagWidgetList.add(
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: ColorLibrary.cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 3,
                  offset: Offset(2, 2), // Shadow position
                ),
              ],
            ),
            child: Center(
                child: Text(
              user_data.taglist[i].length>8?user_data.taglist[i].substring(0,8)+'...':user_data.taglist[i],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15),
            )),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: ColorLibrary.cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 3,
                  offset: Offset(2, 2), // Shadow position
                ),
              ],
            ),
            child: Center(
                child: Text(
              '태그 생성',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15),
            )),
          ),
        ),
        Row(children: addTagWidgetList)
      ],
    );
  }
}
