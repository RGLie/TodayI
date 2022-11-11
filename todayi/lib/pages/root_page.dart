import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/home_page.dart';
import 'package:todayi/pages/login_page.dart';
import 'package:todayi/pages/main_page.dart';
import 'package:todayi/providers/user_provider.dart';

class RootPage extends StatelessWidget {
  UserProvider db = UserProvider();

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<User?>(context);
    bool isLogIn = userData != null;

    // return MultiProvider(
    //   providers: [
    //     StreamProvider<TUser>.value(
    //       value: db.getUser(userData!.uid),
    //       initialData: TUser(email: 'email', uid: 'uid', name:'name'),
    //     ),
    //   ],
    //   child: ((){
    //     if(isLogIn){
    //       return MainPage();
    //     }
    //     return LoginPage();
    //   })()
    // );
    if(isLogIn){
      return MainPage();
    }
    return LoginPage();
  }
}
