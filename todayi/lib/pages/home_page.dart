import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/pages/root_page.dart';
import 'package:todayi/providers/button_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/home_page/quote.dart';
import 'package:todayi/widgets/home_page/start_button.dart';

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
    return Stack(
      children: [
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
                              color: ColorLibrary.textThemeColor,
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
              StartButton(),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: ColorLibrary.textThemeColor),
                      onPressed: () {},
                    ),
                  ),
                  QuoteWidget(
                    quotation:
                        '기록하기를 좋아하라, 쉬지말고 기록해라, 생각이 떠오르면 수시로 기록하라, \n기억은 흐려지고 생각은 사라진다.',
                    person: '다산 정약용',
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorLibrary.textThemeColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
