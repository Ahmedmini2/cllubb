


import 'package:cllubb/Login%20and%20Signup/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class UpdatePassword extends StatefulWidget {
  MainUpdatePassword createState() => MainUpdatePassword();

}
class MainUpdatePassword extends State<UpdatePassword> {

  final _formKey = GlobalKey<FormState>();


  final TextEditingController emailController = new TextEditingController();


// firebase

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title:Text("reset Your Password" , style: TextStyle(fontSize: 20,fontFamily: 'BankGM',color: Colors.blueGrey),),



        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.white,
            Colors.white,
            Colors.white,
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
              child : Image.asset('assets/images/images/cllubblogo.png', fit: BoxFit.fitWidth,),
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
                      return "Please Enter Your Email";
                    }
                    // reg Wxpression for Emaiil Validation
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                    {
                      return (" Please enter a valid Email");
                    }
                    return null;
                  },
                  onSaved: (value){

                    emailController.text = value!;
                  },
                  textInputAction: TextInputAction.next,

                  decoration: InputDecoration(
                      labelText: 'Email',
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


            const SizedBox(height: 5,),
            Container(
              width: 350,
              height: 50,
              padding: const EdgeInsets.only(bottom: 10),
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child:   ElevatedButton(
                child: const Text(" Reset " ,),
                onPressed: () {
                  _auth.sendPasswordResetEmail(email: emailController.text);
                  Fluttertoast.showToast(msg: "Reset Password Was Sent Successfully");
                  Navigator.of(context).pop();

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
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text('Log in' , style: TextStyle(fontSize: 15, color: Color(0xFFFE6F4B)),),
                )


            ),





          ],
        ),
      ),
    );


  }

}

