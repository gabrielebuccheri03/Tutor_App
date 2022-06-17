// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorappalpha/model/user_model.dart';
import 'package:tutorappalpha/screen/login_screen.dart';
import 'package:tutorappalpha/screen/NavBar.dart';
import 'package:tutorappalpha/screen/homepage.dart';
import 'package:tutorappalpha/GlobalVariables.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();  

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    globals.user=loggedInUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f8fc),
      extendBodyBehindAppBar: true,

      drawer: NavBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xFF3c8eec),size: 30),
        
      ),

      body:Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150,
              child : Image.asset("assets/Tutor.png",fit : BoxFit.contain), 
              ),
              Text(
                "Benvenuto", 
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                "${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: TextStyle(color:Color(0xFFb6b9ba), fontWeight: FontWeight.w500),
              ),
              Text(
                "${loggedInUser.email}",
                style: TextStyle(color:Colors.black54, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15,),
              ActionChip(
                backgroundColor: Colors.white,
                avatar: Icon(Icons.logout, color: Color(0xFF3c8eec),),
                label: Text("Esci", style: TextStyle(color: Color(0xFF3c8eec),fontWeight: FontWeight.bold,fontSize: 14)),
                onPressed: (){
                  logout(context);
                }
                
              )
            ],
          )
        )
      ),        
    );
  }
  Future<void> logout(BuildContext context) async{

      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
    }
}
