import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('About', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.125,
          width: double.infinity,
        ),
        Table(
          //IntrinsicColumnWidth()FixedColumnWidth(64)
          columnWidths: {
            0: FixedColumnWidth(MediaQuery.of(context).size.width*0.15),
            1: IntrinsicColumnWidth(),
            2: FixedColumnWidth(MediaQuery.of(context).size.width*0.25),
            3: FixedColumnWidth(400),
            4: FlexColumnWidth()
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow( 
              children: [
                Container(),
                Container(
                  child: Text('하루를 마무리하는 습관', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 43, color: Color(0xff6A3B00))),
                ),
                Container(),
                Container(),
                Container(),
              ]
            ),
            TableRow( 
              children: [
                Container(
                  color: ColorLibrary.textThemeColor,
                  height: 3,
                ),
                Container(
                  
                  child: Text('Today I', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 105, fontFamily: 'NotoSansKR')),
                ),
                Container(
                  color: ColorLibrary.textThemeColor,
                  height: 3,
                ),
                Container(
                  padding: EdgeInsets.only(left:10, right:10),
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 90.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3A2000),
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText('Learned'),
                          FadeAnimatedText('Designed'),
                          FadeAnimatedText('Read'),
                          FadeAnimatedText('Developed', textStyle: TextStyle(fontSize: 80)),
                          FadeAnimatedText('Learned'),
                          FadeAnimatedText('Designed'),
                          FadeAnimatedText('Read'),
                          FadeAnimatedText('Developed', textStyle: TextStyle(fontSize: 80)),
                          FadeAnimatedText('Learned'),
                          FadeAnimatedText('Designed'),
                          FadeAnimatedText('Read'),
                          FadeAnimatedText('Developed', textStyle: TextStyle(fontSize: 80)),
                        ],
                        onTap: () {
                          
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  color: ColorLibrary.textThemeColor,
                  height: 3,
                ),
              ]
            )
          ],
        ),
        Container(
          width: 260,
          height: 290,
          decoration: BoxDecoration(
            color: ColorLibrary.cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 5,
                offset: Offset(4, 4), // Shadow position
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                width: 150,
                image: AssetImage('assets/icons/write_icon.png'),
              ),
              Text('시작하기', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),)
            ],
          ),
        ),

        SizedBox(
          height: 35,
        ),

        Container(
          child: Column(
            children: [
              Text('명언', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),)
            ],
          ),
        )
      ],
    );
  }
}
