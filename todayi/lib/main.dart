import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todayi/pages/home_page.dart';
import 'package:todayi/providers/button_provider.dart';
import 'package:todayi/providers/start_button_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context).textTheme.apply(
        // bodyColor: ColorLibrary.textThemeColor,
        bodyColor: Colors.black,
        displayColor: ColorLibrary.textThemeColor,
        fontFamily: 'Pretendard');

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => StartButtonProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ButtonProvider()),
          // StreamProvider<User?>.value(
          //   value: FirebaseAuth.instance.authStateChanges(),
          //   initialData: null,
          // ),
        ],
        child: MaterialApp(
          title: 'Today I',
          theme: ThemeData(
            scaffoldBackgroundColor: ColorLibrary.mainThemeColor,
            textTheme: myTheme,
          ),
          home: HomePage(),
        ));
  }
}
