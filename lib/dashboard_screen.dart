

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Account Side/account_tap.dart';

import 'Widget/app_icons2.dart';
import 'home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainDashboard extends StatefulWidget {
  DashboardScreen createState() => DashboardScreen();

}
class DashboardScreen extends State<MainDashboard> {
  bool isSearching = false;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        print('eror');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainDashboard()));
      }
      else if (_selectedIndex == 2) {
        print('eror2222');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AccountTap()));
      }
      else if (_selectedIndex == 0) {
        print('eror333333');
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => MainPage()) ,
              (Route<dynamic> route) => false,);

      }
    });
  }
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
        onWillPop: () async {
      final difference = DateTime.now().difference(timeBackPressed);
      final isExitWarning = difference >= Duration(seconds: 2);
      timeBackPressed = DateTime.now();


      if(isExitWarning){
        final message = ' Press Back Button Again to Exit';
        Fluttertoast.showToast(msg: message , fontSize: 18);

        return false;
      }
      else {
        Fluttertoast.cancel();
        return true;
      }
    } ,
    child: Scaffold(resizeToAvoidBottomInset: false,



      backgroundColor: Color(0xFF494949),
      // HEADER
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.3,
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu_outlined))
        ],

        title: const Text('Social Media', style: TextStyle(color: Colors.white , fontFamily: 'BankGR'),),

      ),

      //////////////////////////////////////////////////////////////////////////////////////// Buttom Bar

      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor:  Color(0xFF343434),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFFFE6F4B),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        //New
        items:  <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppLocalizations.of(context)!.services,




          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: AppLocalizations.of(context)!.dashboard,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: AppLocalizations.of(context)!.myaccount,
          ),


        ],

      ),





      body:  ListView(

        children: [


          const SizedBox(height: 20,),
          Stack(

            children: [

              Transform.rotate(
                origin: const Offset(30, -60),
                angle: 2.4,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 75,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [Color(0xffc2c6c6), Color(0xFF494949)],
                    ),
                  ),
                ),
              ),


              Column(



                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          CatigoryW2(
                            image: 'assets/images/images/facebook.png',
                            text: 'Facebook',

                            color: const Color(0x9ED9D9D9),
                            number: 200,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          CatigoryW2(
                            image: 'assets/images/images/Cbackground.png',
                            text: 'CLLUBB',

                            color: const Color(0x9ED9D9D9),
                            number: 210,
                          ),
                        ]),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          CatigoryW2(
                            image: 'assets/images/images/youtube.png',
                            text: 'Youtube',

                            color: const Color(0x9ED9D9D9),
                            number: 202,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          CatigoryW2(
                            image: 'assets/images/images/tiktok.png',
                            text: 'TikTok',

                            color: const Color(0x9ED9D9D9),
                            number: 203,
                          ),

                        ]),

                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          CatigoryW2(
                            image: 'assets/images/images/instagram.png',
                            text: 'Instagram',

                            color: const Color(0x9ED9D9D9),
                            number: 204,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          CatigoryW2(
                            image: 'assets/images/images/snapchat.png',
                            text: 'Snapchat',

                            color: const Color(0x9ED9D9D9),
                            number: 205,
                          ),


                        ]),

                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          CatigoryW2(
                            image: 'assets/images/images/telegram.png',
                            text: 'Telegram',

                            color: const Color(0x9ED9D9D9),
                            number: 206,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          CatigoryW2(
                            image: 'assets/images/images/whatsapp.png',
                            text: 'Whatsapp',

                            color: const Color(0x9ED9D9D9),
                            number: 207,
                          ),


                        ]),

                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          CatigoryW2(
                            image: 'assets/images/images/twitter.png',
                            text: 'Twitter',

                            color: const Color(0x9ED9D9D9),
                            number: 201,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          CatigoryW2(
                            image: 'assets/images/images/linkedin (1).png',
                            text: 'LinkedIn',

                            color: const Color(0x9ED9D9D9),
                            number: 209,
                          ),
                        ]),


                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),



                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                  ]),


            ],
          ),
        ],),




    ));
  }
}