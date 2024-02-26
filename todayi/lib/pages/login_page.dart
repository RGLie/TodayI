import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
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
                  color: ColorLibrary.textThemeColor,
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
                Container(
                  width: double.infinity,
                  child: Tab(
                    text: 'Sign In',
                    
                  ),
                ),
                // second tab [you can add an icon using the icon property]
                Container(
                  width: double.infinity,
                  child: Tab(
                    text: 'Sign Up',
                    
                  ),
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
                SingleChildScrollView(
                  child: Form(
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
                                  labelText: '이메일',
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
                                  labelText: '패스워드',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '패스워드를 입력하세요.';
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
                            FocusScope.of(context).requestFocus(new FocusNode());
                            if (_formKey.currentState!.validate()) {
                              signIn(_inEmailController.text, _inPasswordController.text);
                                _inEmailController.clear();
                                _inPasswordController.clear();
                                
                            }
                          },
                        ),
                      ],
                    ),
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
                                  labelText: '이메일',
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
                                  labelText: '패스워드',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '패스워드를 입력하세요.';
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
                                  labelText: '패스워드 확인',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value !=_upPasswordController.text){
                                  return "패스워드가 일치하지 않습니다";
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
                                  labelText: '닉네임',
                                  labelStyle: TextStyle(
                                      color: ColorLibrary.textThemeColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorLibrary.textThemeColor),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '닉네임을 입력하세요.';
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
                            FocusScope.of(context).requestFocus(new FocusNode());
                            if (_formUpKey.currentState!.validate()) {
                              createUser(_upEmailController.text, _upPasswordController.text, _upNameController.text);
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
  
  void _handleSignIn(String email, String pw) async{
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pw);
  }

  Future<bool> signIn(String email, String pw) async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pw
    );
    CollectionReference users = await FirebaseFirestore.instance.collection('users');
    
    users.doc(credential.user!.uid).update({'recentlogindate':DateFormat('yyyy/MM/dd-HH:mm:ss').format(DateTime.now())});

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      //logger.w('No user found for that email.');
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
                  "계정이 존재하지 않습니다.",
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
    } else if (e.code == 'wrong-password') {
      //logger.w('Wrong password provided for that user.');
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
                  "비밀번호가 다릅니다.",
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

  Future<bool> createUser(String email, String pw, String name) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pw,
      );
      addUserData(email, name, credential.user!.uid, DateFormat('yyyy/MM/dd-HH:mm:ss').format(DateTime.now()), DateFormat('yyyy/MM/dd-HH:mm:ss').format(DateTime.now()));
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
                  new Text("환영합니다", style: TextStyle(color: Colors.indigoAccent),),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "가입이 완료되었습니다.",
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

  void addUserData(String EMAIL, String NAME, String UID, String RDATE, String RLDATE){
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    TUser userModel = TUser(email: EMAIL, uid: UID, name: NAME, registerdate: RDATE, recentlogindate: RLDATE, istag: false, taglist: ['index'], count: 1);
    users.doc(UID).set(userModel.toJson());
  }

}
