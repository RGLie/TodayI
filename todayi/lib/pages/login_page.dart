import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/pages/home_page.dart';
import 'package:todayi/providers/button_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/login_page/sign_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _inEmailController = TextEditingController();
  final _inPasswordController = TextEditingController();
  final _upEmailController = TextEditingController();
  final _upPasswordController = TextEditingController();
  final _upPasswordCheckController = TextEditingController();
  final _upNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formUpKey = GlobalKey<FormState>();
  double tabBarHeight = 220;

  FirebaseAuth auth = FirebaseAuth.instance;

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
          Container(
            color: ColorLibrary.textThemeColor,
            height: 2,
            width: 400,
          ),
          SizedBox(
            height: 3,
          ),
          Text('Today I',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 105,
                  fontFamily: 'NotoSansKR')),
          SizedBox(
            height: 15,
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
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: Color(0xffDFD7CA),
            ),
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                // borderRadius: BorderRadius.circular(
                //   25.0,
                // ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
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
            height: tabBarHeight,
            width: 400,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorLibrary.cardColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
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
                            controller: _inEmailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: ColorLibrary.textThemeColor,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.mail),
                                suffixIconColor: ColorLibrary.textThemeColor,
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: ColorLibrary.textThemeColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorLibrary.textThemeColor),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '이메일은 필수사항입니다.';
                              }
                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                return '잘못된 이메일 형식입니다.';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _inPasswordController,
                            obscureText: true,
                            cursorColor: ColorLibrary.textThemeColor,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.lock),
                                suffixIconColor: ColorLibrary.textThemeColor,
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: ColorLibrary.textThemeColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorLibrary.textThemeColor),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '비밀번호를 입력하세요.';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 3,
                      ),
                      SignInUpButton(
                        signText: 'Sign In',
                        signTab: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // second tab bar view widget
                ///////////////////////////////////////////////
                SingleChildScrollView(
                  child: Form(
                    key: _formUpKey,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _upEmailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorLibrary.textThemeColor,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.mail),
                                  suffixIconColor: ColorLibrary.textThemeColor,
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '이메일은 필수사항입니다.';
                                }
                                if (!RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(value)) {
                                  return '잘못된 이메일 형식입니다.';
                                }
                                return null;
                              },
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _upPasswordController,
                              obscureText: true,
                              cursorColor: ColorLibrary.textThemeColor,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.lock),
                                  suffixIconColor: ColorLibrary.textThemeColor,
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '비밀번호를 입력하세요.';
                                }
                                return null;
                              },
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _upPasswordCheckController,
                              obscureText: true,
                              cursorColor: ColorLibrary.textThemeColor,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.lock),
                                  suffixIconColor: ColorLibrary.textThemeColor,
                                  border: OutlineInputBorder(),
                                  labelText: 'Password Check',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value !=_upPasswordController.text){
                                  return "비밀번호가 일치하지 않습니다";
                                }
                                return null;
                              },
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _upNameController,
                              cursorColor: ColorLibrary.textThemeColor,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.person),
                                  suffixIconColor: ColorLibrary.textThemeColor,
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '이름을 입력하세요.';
                                }
                                return null;
                              },
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        SignInUpButton(
                          signText: 'Sign Up',
                          signTab: () {
                            if (_formUpKey.currentState!.validate()) {
                              createUser(_upEmailController.text, _upPasswordController.text);
                                _upEmailController.clear();
                                _upPasswordController.clear();
                                _upNameController.clear();
                                _upPasswordCheckController.clear();
                            }
                            

                          },
                        ),
                      ],
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

  void _signUp() async{
    UserCredential result;
    dynamic user;

    result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _upEmailController.text, password: _upPasswordController.text);

  }

    Future<bool> createUser(String email, String pw) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pw,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //print('The password provided is too weak.');
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: Column(
                children: <Widget>[
                  new Text("경고", style: TextStyle(color: Colors.redAccent),),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "비밀번호가 취약합니다. 비밀번호를 다시 입력해주세요.",
                    style: TextStyle(color: Colors.black)
                  ),
                ],
              ),
              actions: <Widget>[
                new ElevatedButton(
                  child: new Text("확인"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorLibrary.textThemeColor
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
        );


      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: Column(
                children: <Widget>[
                  new Text("경고", style: TextStyle(color: Colors.redAccent),),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "이미 가입된 이메일입니다. 다른 이메일을 입력해주세요.",
                    style: TextStyle(color: Colors.black)
                  ),
                ],
              ),
              actions: <Widget>[
                new ElevatedButton(
                  child: new Text("확인"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorLibrary.textThemeColor
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
        );        
      }
    } catch (e) {
      //logger.e(e);
      return false;
    }
    // authPersistence(); // 인증 영속
    return true;
  }
}
