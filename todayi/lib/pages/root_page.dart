import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/login_page.dart';
import 'package:todayi/providers/user_provider.dart';

class RootPage extends StatelessWidget {
  UserProvider db = UserProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
        // StreamProvider<TUser>.value(
        //   value: db.getUser(),
        //   initialData: null,
        // ),
      ],
    );
  }
}
