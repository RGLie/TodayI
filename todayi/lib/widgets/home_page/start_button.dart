import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/pages/root_page.dart';
import 'package:todayi/utils/colors.dart';

import '../../providers/button_provider.dart';

class HomePageStartButton extends StatelessWidget {
  Color boxColor;
  List<BoxShadow> boxShadows;
  HomePageStartButton({super.key,
    required this.boxColor,
    required this. boxShadows
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: 260,
      height: 290,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadows,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            width: 150,
            image: AssetImage('assets/icons/write_icon.png'),
          ),
          Text(
            '시작하기',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}



class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  late StartButtonProvider _startButtonProvider;
  
  @override
  Widget build(BuildContext context) {
    _startButtonProvider = Provider.of<StartButtonProvider>(context);

    return MouseRegion(
      onEnter: (PointerEvent details) {
        _startButtonProvider.isRegion();
      },
      onExit: (PointerEvent details) {
        _startButtonProvider.isnRegion();
      },
      child: InkWell(
        onTap: () {
          _startButtonProvider.clicked();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RootPage()),
          ); 
        },
        child: (() {
          switch (_startButtonProvider.mouse_state) {
            case 1:
              return HomePageStartButton(
                boxColor: ColorLibrary.cardColorRegioned,
                boxShadows: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 5,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              );
            case 2:
              return HomePageStartButton(
                boxColor: ColorLibrary.cardColorRegioned,
                boxShadows: [],
              );
          }
          return HomePageStartButton(
            boxColor: ColorLibrary.cardColor,
            boxShadows: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 5,
                offset: Offset(4, 4), // Shadow position
              ),
            ],
          );
        })(),
      )
    );
  }
}