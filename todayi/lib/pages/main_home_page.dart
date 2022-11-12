import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/utils/colors.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    var user_data = Provider.of<TUser>(context);
    //user_data.name
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          color: ColorLibrary.textThemeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Text('노트', style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
              
            ],
          ),
        ),
        Container()
      ],
    );
  }
}