// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tutorappalpha/screen/user.dart';
import 'package:tutorappalpha/screen/profilewidget.dart';
import 'package:tutorappalpha/screen/userPreferences.dart';
import 'package:tutorappalpha/GlobalVariables.dart' as globals;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked:()async{},
          ),
          const SizedBox(height: 30),
          buildName(user),
          const SizedBox(height: 50),
          //buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        (globals.user.firstName ?? "null") +" "+ (globals.user.secondName?? "null"),
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
      ),
      const SizedBox(height: 8),
      Text(
        (globals.user.email ?? "null"),
        style: TextStyle(color: Colors.grey),
      )
     
    ],
  );
/*
  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Su di te",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            UserPreferences.myUser.about,
            style: TextStyle(fontSize: 16,height: 1.4),
          ),
      ], 
    )
  );
*/

}


