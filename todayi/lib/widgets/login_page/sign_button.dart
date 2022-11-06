import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/button_provider.dart';
import 'package:todayi/utils/colors.dart';

class SignInUpButton extends StatefulWidget {
  Function signTab;
  String signText;
  SignInUpButton({super.key, required this.signTab, required this.signText});

  @override
  State<SignInUpButton> createState() => _SignInUpButtonState();
}

class _SignInUpButtonState extends State<SignInUpButton> {
  late ButtonProvider _signButtonProvider;

  @override
  Widget build(BuildContext context) {
    _signButtonProvider = Provider.of<ButtonProvider>(context);

    return MouseRegion(
      onEnter: (PointerEvent details) {
        _signButtonProvider.isRegion();
      },
      onExit: (PointerEvent details) {
        _signButtonProvider.isnRegion();
      },
      child: InkWell(
        onTap: () {
          _signButtonProvider.clicked();
          widget.signTab();
        },
        child: (() {
          switch (_signButtonProvider.mouse_state) {
            case 1:
              return Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorLibrary.textThemeColor,
                  //boxShadow: boxShadows,
                ),
                child: Center(
                    child: Text(
                  widget.signText,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      color: Colors.white),
                )),
              );
          }
          return Container(
            margin: EdgeInsets.all(5),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1.5, color: ColorLibrary.textThemeColor),
              borderRadius: BorderRadius.circular(5),
              //boxShadow: boxShadows,
            ),
            child: Center(
                child: Text(
              widget.signText,
              style: TextStyle(fontSize: 15, fontFamily: 'NotoSansKR'),
            )),
          );
        })(),
      ),
    );
  }
}
