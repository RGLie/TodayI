import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/home_page.dart';
import 'package:todayi/utils/responsive.dart';

class AccountBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var userCollectionData = Provider.of<User?>(context);
    var user_data = Provider.of<TUser>(context);
    var rsp = Responsive(pageContext: context);
    return Container(
      //height: 60,
      padding: EdgeInsets.only(left: rsp.rspWidth(20), right: rsp.rspWidth(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   width: 30,
          // ),
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user_data.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: rsp.rspHeight(18),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    user_data.email,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: rsp.rspHeight(14),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
          IconButton(
              onPressed: () {
                _signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(
                Icons.logout,
                size:rsp.rspHeight(25),
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
