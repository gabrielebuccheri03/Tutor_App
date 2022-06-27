// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tutorappalpha/screen/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  Future<List> getData() async{

    http.Response response = await http.get(
      Uri.parse("https://aqueous-everglades-78338.herokuapp.com/ads?type=piacere"),
      headers: {
        "Accept": "application/json"
      }
    );

    print(response.body);
    List data = jsonDecode(response.body);
    return data;

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
    ]);
    getData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}


