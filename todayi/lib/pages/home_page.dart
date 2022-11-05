import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/button_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/home_page/start_button.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StartButtonProvider _startButtonProvider;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    _startButtonProvider = Provider.of<StartButtonProvider>(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: GridPaper(
            color: Colors.black38,
            divisions: 1,
            interval: 250,
            subdivisions: 1,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'About',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
              ),
              Table(
                //IntrinsicColumnWidth()FixedColumnWidth(64)
                columnWidths: {
                  0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.15),
                  1: IntrinsicColumnWidth(),
                  2: FixedColumnWidth(MediaQuery.of(context).size.width * 0.25),
                  3: FixedColumnWidth(400),
                  4: FlexColumnWidth()
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Container(),
                    Container(
                      child: Text('하루를 마무리하는 습관',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 43,
                              color: Color(0xff6A3B00))),
                    ),
                    Container(),
                    Container(),
                    Container(),
                  ]),
                  TableRow(children: [
                    Container(
                      color: ColorLibrary.textThemeColor,
                      height: 3,
                    ),
                    Container(
                      child: Text('Today I',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 105,
                              fontFamily: 'NotoSansKR')),
                    ),
                    Container(
                      color: ColorLibrary.textThemeColor,
                      height: 3,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
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
                              FadeAnimatedText('Developed',
                                  textStyle: TextStyle(fontSize: 80)),
                              FadeAnimatedText('Learned'),
                              FadeAnimatedText('Designed'),
                              FadeAnimatedText('Read'),
                              FadeAnimatedText('Developed',
                                  textStyle: TextStyle(fontSize: 80)),
                              FadeAnimatedText('Learned'),
                              FadeAnimatedText('Designed'),
                              FadeAnimatedText('Read'),
                              FadeAnimatedText('Developed',
                                  textStyle: TextStyle(fontSize: 80)),
                            ],
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: ColorLibrary.textThemeColor,
                      height: 3,
                    ),
                  ])
                ],
              ),
              MouseRegion(
                onEnter: (PointerEvent details) {_startButtonProvider.isRegion();},
                onExit: (PointerEvent details) {_startButtonProvider.isnRegion();},
                child: InkWell(
                  onTap: () {
                    _startButtonProvider.clicked();
                  },
                  child: ((){
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
                          boxShadows: [
                          ],
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
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                color: ColorLibrary.textThemeColor,
                height: 2,
                width: 260,
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      '기록하기를 좋아하라, 쉬지말고 기록해라, 생각이 떠오르면 수시로 기록하라, \n기억은 흐려지고 생각은 사라진다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '- 다산 정약용 -',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      color: ColorLibrary.textThemeColor,
                      height: 2,
                      width: 260,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
