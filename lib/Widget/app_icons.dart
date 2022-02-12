
import 'package:cllubb/Secound%20Dashboard/news_main.dart';
import 'package:cllubb/Websites/Marketing%20Factory/news_websites.dart';
import 'package:cllubb/Websites/Marketing%20Factory/newsen_website.dart';
import 'package:cllubb/Websites/Property%20Sites/agents_crm.dart';
import 'package:cllubb/Websites/Property%20Sites/agents_data.dart';
import 'package:cllubb/Websites/Property%20Sites/agents_magazine.dart';
import 'package:cllubb/Websites/Property%20Sites/agents_tv.dart';
import 'package:cllubb/Websites/Property%20Sites/cllubb.dart';
import 'package:cllubb/Websites/Property%20Sites/p_agents_map.dart';
import 'package:cllubb/Websites/Property%20Sites/p_heat_map.dart';
import 'package:cllubb/Websites/Property%20Sites/p_index_map.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CatigoryW extends StatelessWidget {
  String image;
  String text;
  Color color;
  int number;

  CatigoryW({required this.image, required this.text, required this.color , required this.number});

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
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 16, fontFamily: 'BankGR'),
            ),
          ],
        ),
      ),
      onTap: () {
        if(this.number == 1 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsArabic()),);
        }
        else if(this.number == 2 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsEnglish()),);
        }
        else if(this.number == 3 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClubWeb()),);
        }
        else if(this.number == 4 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PHeatMap()),);
        }
        else if(this.number == 5 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PIndexMap()),);
        }
        else if(this.number == 6 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PAgentsMap()),);
        }
        else if(this.number == 7 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgentsData()),);
        }
        else if(this.number == 8 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgentsCRM()),);
        }
        else if(this.number == 9 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgentsMagazine()),);
        }
        else if(this.number == 10 ){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgentsTV()),);
        }



      },

    );
  }
}