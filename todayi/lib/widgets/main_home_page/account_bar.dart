import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/home_page.dart';

class AccountBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userCollectionData = Provider.of<User?>(context);
    var user_data = Provider.of<TUser>(context);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   width: 30,
          // ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection('users').doc(userCollectionData!.uid).snapshots(),
            builder: (context, snapshot) {
              Map<String, dynamic> udata = snapshot.data?.data() as Map<String, dynamic>;
              if(!snapshot.hasData){
                return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              );
              }
              
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    udata['name'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    udata['email'],
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              );
            }
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
