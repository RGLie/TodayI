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
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: ColorLibrary.textThemeColor,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.mail),
                          suffixIconColor: ColorLibrary.textThemeColor,
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: ColorLibrary.textThemeColor
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorLibrary.textThemeColor),
                          )
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return '이메일은 필수사항입니다.';
                          }
                          if(!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)){
                            return '잘못된 이메일 형식입니다.';
                          }
                          return null;
                        },
                      )
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                        controller: _passwordController,
                        cursorColor: ColorLibrary.textThemeColor,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          suffixIconColor: ColorLibrary.textThemeColor,
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: ColorLibrary.textThemeColor
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorLibrary.textThemeColor),
                          )
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return '비밀번호를 입력하세요.';
                          }
                          return null;
                        },
                      )
                      ),
                    ],
                  ),
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
