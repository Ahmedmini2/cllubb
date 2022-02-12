



import 'package:cllubb/Secound%20Dashboard/architects_main.dart';
import 'package:cllubb/Secound%20Dashboard/barber_main.dart';
import 'package:cllubb/Secound%20Dashboard/brands_main.dart';
import 'package:cllubb/Secound%20Dashboard/builders_main.dart';
import 'package:cllubb/Secound%20Dashboard/cars_main.dart';
import 'package:cllubb/Secound%20Dashboard/clinic_main.dart';
import 'package:cllubb/Secound%20Dashboard/furniture_main.dart';
import 'package:cllubb/Secound%20Dashboard/insurance_main.dart';
import 'package:cllubb/Secound%20Dashboard/materials_main.dart';
import 'package:cllubb/Secound%20Dashboard/media_main.dart';
import 'package:cllubb/Secound%20Dashboard/property_main.dart';
import 'package:cllubb/Secound%20Dashboard/tech_main.dart';
import 'package:cllubb/Websites/Crypto%20Webs/bogged_finance.dart';
import 'package:cllubb/Websites/Crypto%20Webs/bscscan.dart';
import 'package:cllubb/Websites/Crypto%20Webs/clb_buytoken.dart';
import 'package:cllubb/Websites/Crypto%20Webs/coin_monner.dart';
import 'package:cllubb/Websites/Crypto%20Webs/coinmoonhunt.dart';
import 'package:cllubb/Websites/Crypto%20Webs/coinvote.dart';
import 'package:cllubb/Websites/Crypto%20Webs/dex_tool.dart';
import 'package:cllubb/Websites/Crypto%20Webs/gecko_terminal.dart';
import 'package:cllubb/Websites/Crypto%20Webs/poocoin.dart';
import 'package:cllubb/Websites/Marketing%20Factory/brochure_property_web.dart';
import 'package:cllubb/Websites/Marketing%20Factory/homes_website.dart';

import 'package:cllubb/Websites/Marketing%20Factory/tube_property_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Account Side/account_tap.dart';
import 'Secound Dashboard/news_main.dart';
import 'Websites/Crypto Webs/coin_scope.dart';
import 'Websites/Marketing Factory/basket_web.dart';
import 'Websites/Marketing Factory/property_news_web.dart';
import 'dashboard_screen.dart';





class MainPage extends StatefulWidget {
  HomeScreen createState() => HomeScreen();

}
 class HomeScreen extends State<MainPage> {


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        print('eror');
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => MainDashboard()),
              (Route<dynamic> route) => false,
        );

      }
      else if (_selectedIndex == 2) {
        print('eror2222');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AccountTap()));
      }
      else if (_selectedIndex == 0) {
        print('eror333333');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainPage()));
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
          final message = 'Press Back Button Again to Exit';
          Fluttertoast.showToast(msg: message , fontSize: 18);

          return false;
        }
        else {
          Fluttertoast.cancel();
          return true;
        }
      } ,
      child: Scaffold(



      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
      // HEADER
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0.0,
        shadowColor: Colors.white,
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Image.asset('assets/images/images/new-cllubb-web-logo-3.png', height: 50, width: 150, alignment: Alignment.topLeft,),

        actions: <Widget>[


           IconButton(
            icon: const Icon(Icons.search , color: Color(0xFFFE6F4B)),
            onPressed: () async {
              final result =
                  await showSearch(context: context, delegate: AppSearch());
              print(' Result :  $result');

              if(result == 'Homes'){

              }



            },
          )
        ],

        backgroundColor: Colors.white,
      ),

      //////////////////////////////////////////////////////////////////////////////////////// Buttom Bar

      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFE6F4B),//New
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
        children: <Widget>[
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-1.png'),
                      fit: BoxFit.cover,
                    ),

                  ),



//////////////////////////////////////////////////////////////////////////////////////// problem here


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // FlatButton(
                      //     color: Color(0xFFFE6F4B),
                      //     textColor: Colors.white,
                      //     onPressed: () {
                      //       launch('https://cllubb.com/buytoken');
                      //     },
                      //     child: Text("BUY TOKEN NOW")),
                    ],
                  ),
                ),


                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // FlatButton(
                      //     color: Color(0xFFFE6F4B),
                      //     textColor: Colors.white,
                      //     onPressed: () {
                      //       launch('https://cllubb.com/buytoken');
                      //     },
                      //     child: Text("BUY TOKEN NOW")),
                    ],
                  ),


                ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // FlatButton(
                    //     color: Color(0xFFFE6F4B),
                    //     textColor: Colors.white,
                    //     onPressed: () {
                    //       launch('https://cllubb.com/buytoken');
                    //     },
                    //     child: Text("BUY TOKEN NOW")),
                  ],
                ),

                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-5.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-6.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-7.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-8.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-9.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/images/cover-10.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),

              ],

              options: CarouselOptions(
              height: 180,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            ),

              const SizedBox(height: 20,),
              Container(
                color: Colors.white,
               child: (Row(
                children: <Widget>[
       // ...
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 50,
                        )),
                  ),

                   Text(AppLocalizations.of(context)!.factory , style: TextStyle(fontFamily: 'BankGR'),),

                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 50,
                        )),
                  ),

                  ],
                  )),
                  ),
          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines

            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[



              FlatButton(

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomesWeb()),);
                },
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/icon-8.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("C HOMES" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),


              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/icon-1 (1).png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("C NEWS" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),


              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PropertyNewsWeb()),);
                },
                child: Column(


                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/icon-2.png'), width:90, height: 70,),
                    SizedBox(height: 2,),
                    Text("C PROPERTY" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TubePropertyWeb()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/icon-4.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("C TUBE" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              ],
          ),

          const SizedBox(height: 25,),
          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[



              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BrochurePropertyWeb()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/icon-3.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("C BROCHURE" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),


              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BasketWeb()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/icon-7.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("C BASKET" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              ],
          ),

          const SizedBox(height: 25,),




          //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Real Estate







          SizedBox(height: 15,),
          Container(
            color: Colors.white,
            child: (Row(
              children: <Widget>[
                // ...
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),

                 Text(AppLocalizations.of(context)!.categories, style: TextStyle(fontFamily: 'BankGR'),),

                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),

              ],
            )),

          ),

          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines
            alignment: WrapAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PropertyMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/icon-2.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("PROPERTY" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArchitectsMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-16.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("ARCHITECTS" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediaMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON--9.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("MEDIA" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuildersMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-15.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("BUILDERS" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),


          ],
          ),
          const SizedBox(height: 15,),
          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines
            alignment: WrapAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MaterialMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-20.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("MATERIALS" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InsuranceMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-18.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("INSURANCE" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarsMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-10.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("CARS" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FurnitureMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-13.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("FURNITURE" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),


            ],
          ),

          const SizedBox(height: 15,),
          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines
            alignment: WrapAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BarberMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-11.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("BARBER" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClinicMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-14.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("CLINIC" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TechMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-19.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("TECH" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BrandsMain()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/ICON-17.png'),width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("BRANDS" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),


            ],
          ),




          SizedBox(height: 15,),
          Container(
            color: Colors.white,
            child: (Row(
              children: <Widget>[
                // ...
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),

                 Text(AppLocalizations.of(context)!.crypto , style: TextStyle(fontFamily: 'BankGR'),),

                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),

              ],
            )),
          ),

          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines
            alignment: WrapAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClbBuyToken()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-10.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("CLB TOKEN" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BscScan()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-11.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("BSCSCAN" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PooCoin()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-7.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("POOCOIN" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GeckoTerminal()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-2.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("GECKOTERMINAL" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              ],
          ),


          const SizedBox(height: 15,),
          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines
            alignment: WrapAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoinMooner()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-8.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("COINMOONER" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoinScope()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-9.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("COIN SCOPE" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BoggedFinance()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-5.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("BOGGED FINANCE" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DexTools()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-1.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("DEX TOOLS" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

            ],
          ),

          const SizedBox(height: 15,),
          Wrap(

            spacing: -38, // gap between adjacent chips
            runSpacing: 2.0, // gap between lines
            alignment: WrapAlignment.center,

            direction: Axis.horizontal, // main axis (rows or columns)
            children: <Widget>[

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoinMooner()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/cmc.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("CMC" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoinVote()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coinvote_logo.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("COIN VOTE" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoinMoonHunt()),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/logo_big.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("COIN MOON HUNT" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

              FlatButton(
                onPressed: () {

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const <Widget>[
                    Image(image: AssetImage('assets/images/images/coin-icon-2.png'), width: 90, height: 70,),
                    SizedBox(height: 2,),
                    Text("COINGECKO" , style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 30,),




        ],


      ),




    ));
  }
}



class AppSearch extends SearchDelegate<String> {
  final apps = [
    'Property',
    'Architects',
    'Cars',
    'Builders',
    'Live',
    'Data',
    'Brochure',
    'Homes',
    'Club',
    'Tube',
    'Coin',
    'Radar',
    'Barber',
    'Media',
    'Brands',
    'Basket',
    'Insurance Brokers',
    'TV',
    'Furniture',
      ];

  final recentApps = [
    'Homes',
    'Club',
    'Tube',
    'Coin',
    'Radar',
    'Barber',
    'Media',

  ];


  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: (){
         if(query.isEmpty){
            close(context, "");
         } else {
           query = "";
           showSuggestions(context);
         }
        },
        icon: Icon(Icons.clear , color: Color(0xFFFE6F4B),),
    ),
    
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: (){
        close(context, "");
      },
      icon: Icon(Icons.arrow_back));


  @override
  Widget buildResults(BuildContext context) =>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search,size: 120,color: Color(0xFFFE6F4B),),
        const SizedBox(height: 48,),
        Text(
          query,
          style: TextStyle(
            color: Colors.black,
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
    ? recentApps
        : apps.where((app){
          final appLower = app.toString().toLowerCase();
          final queryLower = query.toLowerCase();
          return appLower.startsWith(queryLower);

    }).toList();

    return buildSuggestionsSucsess(suggestions);

  }

  Widget buildSuggestionsSucsess (List<String> suggestions ) => ListView.builder(
    itemCount: suggestions.length,
    itemBuilder: (context, index){
      final suggestion = suggestions[index];
      final queryText = suggestion.substring(0, query.length);
      final remainingText = suggestion.substring(query.length);
      return ListTile(
        contentPadding: EdgeInsets.only(left: 20),

        onTap: (){
          query = suggestion;

          close(context , suggestion);
        },
        minLeadingWidth: -20,
        leading: Image(image: AssetImage('assets/images/images/Cbackground.png'),width: 30, height: 30,),

        title: RichText(
          text: TextSpan( text: queryText,
          style: TextStyle(
            color: Colors.black,

            fontSize: 18,
          ),
          children: [
                TextSpan(
                  text: remainingText,
                  style: TextStyle(
                    color: Colors.grey,

                    fontSize: 16,
                  )
                )
              ],
          ),

        ),

      );
    },

  );

  }


