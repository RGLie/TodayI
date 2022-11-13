import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/content_page_changer.dart';
import 'package:todayi/providers/main_home_page/sidebar_provider.dart';
import 'package:todayi/utils/colors.dart';

class MainPageSideBar extends StatefulWidget {
  const MainPageSideBar({super.key});

  @override
  State<MainPageSideBar> createState() => _MainPageSideBarState();
}

class _MainPageSideBarState extends State<MainPageSideBar> {
  @override
  Widget build(BuildContext context) {
    var user_data = Provider.of<TUser>(context);
    var sidebar_provider = Provider.of<SideBarProvider>(context);

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
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text('Today I',
                    style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
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
                                onTap: () {
                                  sidebar_provider.changeIndex(index);
                                },
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
              ],
            ),
          ),
          Expanded(child: ContentPageChanger())
        ],
      ),
    );
  }
}