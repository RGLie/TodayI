import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/main_page_sidebar.dart';
import 'package:todayi/providers/main_home_page/sidebar_provider.dart';
import 'package:todayi/providers/user_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserProvider db = UserProvider();
  
  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<User?>(context);

    return MultiProvider(
      providers: [
        StreamProvider<TUser>.value(
          value: db.getUser(userData!.uid),
          initialData: TUser(email: '', uid: '', name:'', registerdate: '', recentlogindate: ''),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SideBarProvider()),
      ],
      child: MainPageSideBar()
    );
  }
}
  
