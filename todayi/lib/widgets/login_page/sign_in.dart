import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class SignInWidget extends StatelessWidget {
  GlobalKey<FormState> myKey;
  TextEditingController emailController;
  TextEditingController passwordController;

  SignInWidget({super.key,
    required this.myKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: myKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
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
            controller: passwordController,
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
    );
  }
}