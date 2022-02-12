import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home_screen.dart';
import '../login_screen.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User? user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user?.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
    checkEmailVerified();

    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 2,
        elevation: 0.2,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        toolbarHeight: 40,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("CLLUBB" , style: TextStyle(color: Colors.blueGrey , fontSize: 25, fontFamily: 'BankGM'),)
      ),
      body: user?.emailVerified == false ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' An Email Has Been Sent To \n ${user?.email} \n Please verify Your Email'),
            ElevatedButton(
              child: const Text(" Back " ,),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFE6F4B),
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),

            ),
          ],
        ),
      ) : Dialog(
        child: Container(
          height: 100,
          width: 100,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            CircularProgressIndicator(),
            Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
          ],
        ),),
      ),

    );
  }


  Future<void> checkEmailVerified() async{
    user = auth.currentUser;
    await user?.reload();
    if(user!.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    }
  }
}