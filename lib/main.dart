


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'Localizations/l10n.dart';
import 'Login and Signup/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';

import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([]);



  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final auth = FirebaseAuth.instance;
  User? user;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    localizationsDelegates:[
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,

    ] ,
    supportedLocales: L10n.all,
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: FirebaseAuth.instance.currentUser == null && user?.uid == null ? LoginScreen() : MainPage() ,

  );
}



