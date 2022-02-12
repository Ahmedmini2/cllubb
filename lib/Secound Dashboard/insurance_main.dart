import 'package:cllubb/Account%20Side/account_tap.dart';
import 'package:cllubb/Widget/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../dashboard_screen.dart';
import '../home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class InsuranceMain extends StatefulWidget {
  InsuranceApp createState() => InsuranceApp();

}
class InsuranceApp extends State<InsuranceMain> {
  bool isSearching = false;
  int _selectedIndex = 0;

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

    return  Scaffold(


      resizeToAvoidBottomInset: false,


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

        title: const Text('C Insurance', style: TextStyle(color: Colors.white , fontFamily: 'BankGR'),),

      ),

      //////////////////////////////////////////////////////////////////////////////////////// Buttom Bar

      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor:  Color(0xFF343434),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFF9E9E9E),
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





      body: ListView(

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
                        CatigoryW(
                          image: 'assets/images/images/2 (3).png',
                          text: 'CLLUBB',

                          color: const Color(0x9ED9D9D9),
                          number: 73,
                        ),


                      ]),





                ],
              ),
            ],),
        ],

      ),




    );
  }
}