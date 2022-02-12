import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PrivacyPolicy extends StatefulWidget {
  MainPrivacy createState() => MainPrivacy();

}
class MainPrivacy extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(



          resizeToAvoidBottomInset: false,

          backgroundColor: Colors.white,
          // HEADER
          appBar: AppBar(
            bottomOpacity: 0,
            elevation: 0.0,
            shadowColor: Colors.white,
            toolbarHeight: 60,
            automaticallyImplyLeading: true ,
            iconTheme: const IconThemeData(
              color: Color(0xFFFE6F4B), //change your color here
            ),
            centerTitle: false,
            title: Text('White Paper' , style: TextStyle(fontFamily: 'BankGM' , fontSize: 22, color: Colors.blueGrey),),


            backgroundColor: Colors.white,
          ),

          //////////////////////////////////////////////////////////////////////////////////////// Buttom Bar





          body: Container(),);
  }
}


