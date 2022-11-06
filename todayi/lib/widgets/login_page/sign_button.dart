import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/button_provider.dart';
import 'package:todayi/utils/colors.dart';

class SignInUpButton extends StatefulWidget {
  const SignInUpButton({super.key});

  @override
  State<SignInUpButton> createState() => _SignInUpButtonState();
}

class _SignInUpButtonState extends State<SignInUpButton> {
  late ButtonProvider _signButtonProvider;
  

  @override
  Widget build(BuildContext context) {
    _signButtonProvider = Provider.of<ButtonProvider>(context);
    
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all( 
            width: 1,
            color: ColorLibrary.textThemeColor
          ),
          borderRadius: BorderRadius.circular(5),
          //boxShadow: boxShadows,
        ),
        child: Center(
          child: Text('Sign In',
            style: TextStyle(
              fontSize: 20
            ),
          )
        ),
      ),
    );
  }
}