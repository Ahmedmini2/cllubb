
import 'package:cllubb/Account%20Side/privacy_policy.dart';
import 'package:cllubb/Login%20and%20Signup/Models/user_modle.dart';
import 'package:cllubb/Login%20and%20Signup/login_screen.dart';
import 'package:cllubb/Websites/Marketing%20Factory/whitepaper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dashboard_screen.dart';
import '../home_screen.dart';
import 'contact_us.dart';



class AccountTap extends StatefulWidget {
  MainAccountTap createState() => MainAccountTap();

}
class MainAccountTap extends State<AccountTap> {

 User? user = FirebaseAuth.instance.currentUser;
 UserModel loggedInUser = UserModel();

 @override
 void initState(){
   super.initState();
   FirebaseFirestore.instance
   .collection("users").doc(user!.uid)
   .get()
   .then((value) {
     this.loggedInUser = UserModel.fromMap(value.data());
     setState(() {

     });
   });
 }

int _selectedIndex = 2;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        bottomOpacity: 1,
        elevation: 0.0,
        shadowColor: Colors.white,
        toolbarHeight: 40,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.myaccount , style: TextStyle(fontFamily: 'BankGR' , fontSize: 20 , color: Colors.black),),


        backgroundColor: Colors.white,
      ),


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
        children: [
          Card(
            elevation: 1.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                  leading: const Image(image: AssetImage('assets/images/Createuser.png'), width: 40, height: 40,),
                  title: loggedInUser.firstName == null ? Text(AppLocalizations.of(context)!.guest, style: TextStyle(fontSize: 14),)
                  : Text("${loggedInUser.firstName} ${loggedInUser.lastName} \n${loggedInUser.email}" , style: TextStyle(fontSize: 14)),
                  trailing: Icon(Icons.arrow_forward)
                ),

                const Center(

                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                  height: 0 ,
                )),
                ListTile(

                    leading: Icon(Icons.credit_card),
                    title: Text(AppLocalizations.of(context)!.wallet , style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward)
                ),
              ],
            ),
          ),



          Card(
            elevation: 1.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(

                    title: Text(AppLocalizations.of(context)!.paymentmethods, style: TextStyle(fontSize: 14),),
                    trailing: Icon(Icons.arrow_forward)
                ),

                Center(

                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                      height: 0 ,
                    )),
                ListTile(

                    title: Text(AppLocalizations.of(context)!.transactionshistory, style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward)
                ),
              ],
            ),
          ),



          Card(
            elevation: 1.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(

                    title: Text(AppLocalizations.of(context)!.language, style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward)
                ),

                const Center(

                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                      height: 0 ,
                    )),
                ListTile(
                    onTap: (){
                      FirebaseAuth.instance.sendPasswordResetEmail(email: loggedInUser.email.toString());
                      Fluttertoast.showToast(msg: "Reset Password Was Sent Successfully");
                    },
                    title: Text(AppLocalizations.of(context)!.changepassword, style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward)
                ),
                const Center(

                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                      height: 0 ,
                    )),
                ListTile(

                    title: Text(AppLocalizations.of(context)!.showorhide, style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward)
                ),

              ],
            ),
          ),



      Card(
        elevation: 1.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  <Widget>[
            ListTile(

              onTap: (){
                launch('https://cllubb.com');
              },
                title: RichText(
                  text: TextSpan( text: AppLocalizations.of(context)!.about,
                    style: const TextStyle(
                      color: Colors.black,


                    ),
                    children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.worldver,
                          style: const TextStyle(
                            color: Color(0xFFFE6F4B),
                            fontSize: 14,
                            fontFamily: 'BankGM',
                          )
                      )
                    ],
                  ),

                ),
                trailing: const Icon(Icons.arrow_forward)
            ),

            const Center(

                child: Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                  height: 0 ,
                )),
             ListTile(

               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactUs()));
               },
                title: Text(AppLocalizations.of(context)!.contactus, style: TextStyle(fontSize: 14)),
                trailing: Icon(Icons.arrow_forward)
            ),
            const Center(

                child: Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                  height: 0 ,
                )),
             ListTile(
                onTap: (){
                  launch('https://cllubb.com/files/Whitepaper11.pdf');
                },
                title: Text(AppLocalizations.of(context)!.whitePaper, style: TextStyle(fontSize: 14)),
                trailing: Icon(Icons.arrow_forward)
            ),

            const Center(

                child: Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                  height: 0 ,
                )),
             ListTile(
                onTap: (){
                  Share.share('Download The CLLUBB App Now \nAndroid: https://play.google.com/store/apps/details?id=com.atworld.AtWorld \nIOS: https://apps.apple.com/ae/app/world/id1592133190');
                },
                title: Text(AppLocalizations.of(context)!.shareapp, style: TextStyle(fontSize: 14)),
                trailing: Icon(Icons.arrow_forward)
            ),

            const Center(

                child: Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                  height: 0 ,
                )),
             ListTile(
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      LoginScreen()), (Route<dynamic> route) => false);
                },
                title: Text(AppLocalizations.of(context)!.loginorout, style: TextStyle(color: Colors.red ,),),
                trailing: Icon(Icons.arrow_forward),

            ),

          ],
        ),

      ),],

      ),







    );
  }


}