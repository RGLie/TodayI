import 'package:flutter/material.dart';
import 'package:todayi/utils/colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      //height: 100,
      constraints: BoxConstraints(
        maxWidth: 1000,
      ),
      decoration: BoxDecoration(
        color: ColorLibrary.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 5,
            offset: Offset(3, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    height: 60,
                    width: 60,
                    image: AssetImage('assets/icons/write_icon.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('# Today I',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30
                        )
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Today I 개발일지',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        )
                      ),
                    ],
                  ),
                ],
              ),
              Material(
                color: ColorLibrary.cardColor,
                child: IconButton(
                  splashRadius: 20,
                  onPressed: (){
                
                  }, 
                  icon: Icon(Icons.expand_more, 
                    color: Colors.black54,
                    
                  )
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: ColorLibrary.textThemeColor,
            width: double.infinity,
            height: 2,
          ),
          SizedBox(
            height: 15,
          ),

          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorLibrary.cardContentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Provider를 이용해 Note Card 구현 완료',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 17
              )
            ),
          ),
          SizedBox(
            height: 15,
          ),

          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorLibrary.cardContentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Edit Note 색상 및 디자인 일부 변경',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 17
              )
            ),
          ),

          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right:15, bottom:15, top:5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorLibrary.cardContentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:5),
                      child: Text('# 에러',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20
                        ),
                      ),
                    ),
                    Material(
                      color: ColorLibrary.cardContentColor,
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: (){
                        }, 
                        icon: Icon(Icons.expand_more, 
                          color: Colors.black54,
                          
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorLibrary.cardSubTagColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Builder 오류 해결',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                    )
                  ),
                )
              ],
            )
          )

        ],
      ),
    );
  }
}