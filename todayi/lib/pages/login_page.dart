import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _emailController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        child: GridPaper(
          color: Colors.black38,
          divisions: 1,
          interval: 180,
          subdivisions: 1,
        ),
      ),
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Today I',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 105,
                  fontFamily: 'NotoSansKR')),
          SizedBox(
            height: 20,
          ),
          Container(
            color: ColorLibrary.textThemeColor,
            height: 2,
            width: 400,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            color: Color(0xffDFD7CA),
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                // borderRadius: BorderRadius.circular(
                //   25.0,
                // ),
                color: ColorLibrary.textThemeColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: ColorLibrary.textThemeColor,
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Sign In',
                ),
                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
          // tab bar view here
          Container(
            color: ColorLibrary.cardColor,
            width: 400,
            height: 300,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: TextField(
                          cursorColor: ColorLibrary.textThemeColor,
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          )),
                    )
                  ],
                ),

                // second tab bar view widget
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      )
    ]);
  }
}
