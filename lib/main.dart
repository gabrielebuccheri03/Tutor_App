// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tutorappalpha/screen/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

/*
  final String _baseURL='https://parseapi.back4app.com/classes/';
  final keyApplicationId ='hkht0oxw04SRMepe1ud05BK8aNpTpSlc8ofCZJfs';
  final keyClientkey = 'yWUaXxfkJwTO3pnYWzpTadGTy7dtJaADWFqWpKyn';
  final keyParseServerURL = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerURL, clientKey: keyClientkey, debug: true);
  var utente=ParseObject('utenti')..set('nome','gianni');
  await utente.save();
*/

  await Firebase.initializeApp();
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'LeonSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}


