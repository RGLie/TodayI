import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/content_page_changer.dart';
import 'package:todayi/pages/home_page.dart';
import 'package:todayi/providers/main_home_page/sidebar_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/utils/responsive.dart';
import 'package:todayi/widgets/main_home_page/account_bar.dart';

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
    var rsp = Responsive(pageContext: context);

    final List<String> sidebar_list = ['노트', '타임라인', '태그', '보내기', '소셜'];
    final List<IconData> icon_list = [
      Icons.event_note,
      Icons.timeline,
      Icons.tag,
      Icons.upgrade,
      Icons.public
    ];
    //user_data.name
    return Scaffold(
      body: Row(
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: rsp.rspWidth(250),
            ),
            width: MediaQuery.of(context).size.width * 0.15,
            height: double.infinity,
            color: ColorLibrary.textThemeColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'Today I',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: rsp.rspWidth(45),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: rsp.rspWidth(30)),
                        child: Text(
                          'Contents',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: rsp.rspWidth(18),
                              fontWeight: FontWeight.w300),
                        )),
                    SizedBox(
                      height: rsp.rspWidth(300),
                      child: ListView.builder(
                        itemCount: sidebar_list.length,
                        padding: EdgeInsets.only(
                            left: rsp.rspWidth(20), right: rsp.rspWidth(20), top: rsp.rspHeight(8), bottom: rsp.rspHeight(8)),
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
                                  height: rsp.rspHeight(40),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: rsp.rspWidth(10),
                                      ),
                                      Icon(
                                        icon_list[index],
                                        size: rsp.rspHeight(25),
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: rsp.rspWidth(15),
                                      ),
                                      Text(
                                        sidebar_list[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: rsp.rspWidth(20),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: rsp.rspHeight(70),
                  color: Color(0xff543209),
                  child: AccountBar()
                )
              ],
            ),
          ),
          Expanded(child: ContentPageChanger())
        ],
      ),
    );
  }
}
