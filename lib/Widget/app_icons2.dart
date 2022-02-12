import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CatigoryW2 extends StatelessWidget {
  String image;
  String text;
  Color color;
  int number;

  CatigoryW2({required this.image, required this.text, required this.color , required this.number});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(

        height: 160,
        width: 160,
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0x39212020),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Image.asset(
              image,
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 12, fontFamily: 'BankGR'),
            ),
          ],
        ),
      ),
      onTap: () {
        if(this.number == 200 ){
          launch('https://www.facebook.com/cllubbltd1');
        }
        else if(this.number == 201 ){
          launch('https://www.twitter.com/cllubbltd');
        }
        else if(this.number == 202 ){
          launch('https://www.youtube.com/channel/UCczGzhPii4yBq5IvWuEZ85A');
        }
        else if(this.number == 203 ){
          launch('https://www.tiktok.com/@cllubbltd5?lang=en');
        }
        else if(this.number == 204 ){

          launch('https://www.instagram.com/cllubbltd');
        }
        else if(this.number == 205 ){
          launch('https://www.snapchat.com/add/cllubbltd');
        }
        else if(this.number == 206 ){
          launch('https://t.me/cllubbchat');
        }
        else if(this.number == 207 ){
          launch('https://wa.me/447872270727');
        }
        else if(this.number == 209 ){
          launch('https://soundcloud.com/cllubb-ltd');
        }
        else if(this.number == 210 ){
          launch('https://cllubb.com');
        }





      },

    );
  }
}