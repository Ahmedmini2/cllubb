
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Authentication/verifying.dart';
import 'Models/user_modle.dart';
import 'login_screen.dart';


class SignupScreen extends StatefulWidget {
  MainSignup createState() => MainSignup();

}
class MainSignup extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>() ;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();


  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final phoneController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: Colors.white,
      // HEADER
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: Color(0xFFFE6F4B), //change your color here
        ),
          centerTitle: true,
        actions: [
          TextButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }, child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color:Color(0xFFFE6F4B)),))
        ],
          title: Text(AppLocalizations.of(context)!.createnew, style: TextStyle(color: Colors.black),),

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
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            const SizedBox(height: 20,),
            Container(
              width: 200,
              alignment: Alignment.bottomLeft,
              height: 90,
              child : Image.asset('assets/images/images/Createuser.png', fit: BoxFit.fitWidth,),
            ),

            const SizedBox(height: 10,),
            Container(

              alignment: Alignment.bottomLeft,


              child: Row(
                children:  <Widget>[
                  Text(
                    AppLocalizations.of(context)!.createnewmain,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,

                      ),

                  ),

                ],

              ),



              // LOGIN BUTTON
            ),

            const SizedBox(height: 10,),
            Container(

              alignment: Alignment.bottomLeft,


              child: Row(
                children:  <Widget>[
                  Text(
                    AppLocalizations.of(context)!.createnewmain2,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,

                    ),

                  ),

                ],

              ),
            ),

            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(top: 20),
              width: 350,
              decoration: const BoxDecoration(

              ),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: firstNameController,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{3,}$');
                    if(value!.isEmpty)
                    {
                      return AppLocalizations.of(context)!.firstnamevalidate;
                    }
                    if(!regex.hasMatch(value))
                    {
                      return (" First Name Must Be More Than 3 Letters ");
                    }

                  },
                  onSaved: (value){

                    firstNameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.firstname,

                      labelStyle: TextStyle(color: Colors.black , fontSize: 13),
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
                  controller: lastNameController,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  validator: (value) {

                    if(value!.isEmpty)
                    {
                      return AppLocalizations.of(context)!.lastnamevalidate;
                    }


                  },
                  onSaved: (value){

                    lastNameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.lastname,
                      labelStyle: TextStyle(color: Colors.black ,  fontSize: 13),
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
                key: _formKey2,
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
                      labelStyle: TextStyle(color: Colors.black ,  fontSize: 13),
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
                key: _formKey4,
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
                      labelStyle: TextStyle(color: Colors.black ,  fontSize: 13),
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
                key: _formKey5,
                child: TextFormField(
                  controller: confirmPasswordController,
                  autofocus: false,
                  obscureText: true,
                  validator: (value) {

                    if(confirmPasswordController.text != passwordController.text)
                    {
                      return AppLocalizations.of(context)!.confirmpasswordvalidate;
                    }
                      return null;

                  },
                  onSaved: (value){

                    confirmPasswordController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.confirmpassword,
                      labelStyle: TextStyle(color: Colors.black ,  fontSize: 13),
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
              width: 120,
              height: 50,
              margin: EdgeInsets.only(left: 220,top: 10),
              child:   ElevatedButton(

                child:  Text(AppLocalizations.of(context)!.signup , style: TextStyle(fontFamily: 'BankGR' , fontSize: 20)),
                onPressed: () {
                  signup(emailController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFE6F4B),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),

              ),


            ),

            const SizedBox(height: 50,),












          ],
        ),
      ),
    );
  }
  void signup(String email , String password) async {
    if (_formKey.currentState!.validate() && _formKey1.currentState!.validate() && _formKey2.currentState!.validate()
        && _formKey4.currentState!.validate() && _formKey5.currentState!.validate() )
      {
        await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
          postDetailsToFireStore()

        }).catchError((e)
        {
          Fluttertoast.showToast(msg: e!.message);
        });
      }
  }

  postDetailsToFireStore() async
  {
    // calling firestore
    //calling user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all values

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;


    await firebaseFirestore.collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account Created Successfully');

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => VerifyScreen()),
            (route) => false);

  }
}