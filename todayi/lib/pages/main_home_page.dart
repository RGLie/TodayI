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

    final List<String> sidebar_list = ['노트', '타임라인', '태그', '보내기', '소셜'];
    final List<IconData> icon_list = [Icons.event_note, Icons.timeline, Icons.tag, Icons.upgrade, Icons.public];
    //user_data.name
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            color: ColorLibrary.textThemeColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left:30),
                  child: Text('Contents', 
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
                  )
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: sidebar_list.length,
                    padding: EdgeInsets.only(left: 20, right:20, top:8, bottom: 8),
                    itemBuilder: (BuildContext context, int index) {
                      return Material(
                        color: ColorLibrary.textThemeColor,
                        child: InkWell(
                          // focusColor: Colors.white,
                          //splashColor: Colors.white,
                          // hoverColor: Colors.white,
                          // highlightColor: Colors.white,
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(icon_list[index], color: Colors.white,),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(sidebar_list[index],
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}