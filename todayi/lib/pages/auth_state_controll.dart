import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todayi/pages/login_page.dart';
import 'package:todayi/pages/main_page.dart';

class AuthControllPage extends StatelessWidget {
  const AuthControllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
            return LoginPage();
          }
          // if(!snapshot.data.emailVerified){
          //   return EmailPage(snapshot.data);
          // }
          // if(snapshot.data.displayName==null){
          //   return InputPage(snapshot.data);
          // }
          return MainPage(snapshot.data);
      },
    );
  }
}