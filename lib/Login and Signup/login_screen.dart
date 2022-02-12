


import 'package:cllubb/Account%20Side/update_password.dart';
import 'package:cllubb/Login%20and%20Signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home_screen.dart';
import 'Authentication/verifying.dart';

class LoginScreen extends StatefulWidget {
MainLogin createState() => MainLogin();

}
class MainLogin extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
final _formKey1 = GlobalKey<FormState>();

final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

// firebase

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
      // HEADER
      appBar: AppBar(
        bottomOpacity: 1,
        elevation: 0.0,
        shadowColor: Colors.white,
        toolbarHeight: 40,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title:

            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signInAnonymously().then((UserCredential user){

                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));

                }).catchError((e) {
                  print(e);
                });
              },
              child: Text(AppLocalizations.of(context)!.guest, style: TextStyle( fontSize: 18,color: Color(
                  0xFFFE6F4B)),),
            ),

        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),

          ]),
        ),



////////////////////// Text Fields
      child: Column(
        children: <Widget>[
          const SizedBox(height: 150,),
          Container(
            width: 300,
            padding: EdgeInsets.only(right: 120),
            margin: EdgeInsets.only(right: 70),
            height: 80,
            child : Image.asset('assets/images/images/new-cllubb-web-logo-3.png', fit: BoxFit.fitWidth,),
          ),

          const SizedBox(height: 0,),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: 350,
            decoration: const BoxDecoration(

            ),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: emailController,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value!.isEmpty)
                      {
                       return AppLocalizations.of(context)!.emailvalidate;
                      }
                  // reg Wxpression for Emaiil Validation
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                    {
                      return AppLocalizations.of(context)!.emailvalidate2;
                    }
                  return null;
                },
                onSaved: (value){

                  emailController.text = value!;
                },
                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icon(Icons.verified_user, color: Colors.grey,),
                    labelStyle: TextStyle(color: Colors.grey , fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),

            ),

          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 350,
            decoration: const BoxDecoration(

            ),
            child: Form(
              key: _formKey1,
              child: TextFormField(
                controller: passwordController,
                autofocus: false,
                obscureText: true,
                validator: (value) {
                 RegExp regex = new RegExp(r'^.{6,}$');
                 if(value!.isEmpty)
                   {
                     return AppLocalizations.of(context)!.passwordvalidate;
                   }
                    if(!regex.hasMatch(value))
                      {
                        return AppLocalizations.of(context)!.passwordvalidate2;
                      }
                  
                },
                onSaved: (value){

                  passwordController.text = value!;
                },
                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    prefixIcon: Icon(Icons.lock ,color: Colors.grey,),
                    suffixIcon: Icon(Icons.remove_red_eye_rounded , color: Colors.grey,),
                    labelStyle: TextStyle(color: Colors.grey , fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),

            ),

          ),
        Container(


          
          
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children:  <Widget>[
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdatePassword()));
              },
                child: Text(AppLocalizations.of(context)!.passwordforget,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFE6F4B),

                ),

              ),

              ),

            Text(AppLocalizations.of(context)!.remamberme, style: TextStyle(fontSize: 12),),
            Checkbox(
              // Border Thic shape: OutlineInputBorder(),

              onChanged: null, value: false,

            )

            ],
           
          ),
          


          // LOGIN BUTTON
        ),
          const SizedBox(height: 5,),
        Container(
         width: 350,
          height: 50,
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child:   ElevatedButton(
            child:  Text(AppLocalizations.of(context)!.login),
            onPressed: () {
              signin(emailController.text, passwordController.text);

            },
            style: ElevatedButton.styleFrom(
                primary: Color(0xFFFE6F4B),
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),

          ),


        ),

          const SizedBox(height: 50,),
          Container(
            width: 300,
            height: 50,
            padding: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child:  TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child:  Text(AppLocalizations.of(context)!.createnew , style: TextStyle(fontSize: 12 , color: Colors.black,decoration: TextDecoration.underline),),
            )


          ),





        ],
      ),
      ),
     );


  }
  void signin(String email, String password) async
  {

    if(_formKey.currentState!.validate() && _formKey1.currentState!.validate())
    {

      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyScreen()))
      }).catchError((e) {
        print(e);
      });
    }
    else
      {
        Fluttertoast.showToast(msg: "Verify Your Email Please");
      }
  }  // Login Function
}

