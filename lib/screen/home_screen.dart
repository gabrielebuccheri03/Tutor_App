// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorappalpha/model/user_model.dart';
import 'package:tutorappalpha/screen/login_screen.dart';
import 'package:tutorappalpha/screen/NavBar.dart';
import 'package:tutorappalpha/screen/homepage.dart';
import 'package:tutorappalpha/screen/profilepage.dart';
import 'package:tutorappalpha/GlobalVariables.dart' as globals;
import 'package:tutorappalpha/screen/userPreferences.dart';

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
      globals.user=loggedInUser;
      print(globals.user.firstName);
      print(globals.user.secondName);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          
          child:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                    children: <Widget>[
                      const SizedBox(height: 55),

                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                         children: <Widget>[
                          Container(
                            height: 136,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.blue,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -5,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 128,
                              width: 160,
                              child: ClipOval(
                                
                                child: Image.network(
                                  UserPreferences.myUser.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -35,
                            left: 15,
                            child: SizedBox(
                              height: 136,
                              width: size.width-160,
                              child: Text(
                                "Benvenuto \n${globals.user.firstName}",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                         ],
                      ),
                      Column(
                        children: <Widget>[
                        const SizedBox(height: 80),
                        Text(
                          "Materie da scoprire",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children:<Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:GestureDetector(
                                  onTap: () {
                                  globals.index=1;  
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                },
                                  child:Image.asset('assets/matematica.png', width:152, height:152)
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:Image.asset('assets/biologia.jpg', width:152, height:152)
                              )
                            ),
                          ]
                        ),
                        Row(
                          children:<Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:Image.asset('assets/scacchi.png', width:152, height:152)
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:Image.asset('assets/russo.png', width:152, height:152)
                              )
                            ),
                          ]
                        ),
                        Row(
                          children:<Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:Image.asset('assets/fotografia.png', width:152, height:152)
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:Image.asset('assets/webdevelopment.png', width:152, height:152)
                              )
                            ),
                          ]
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                    ],
            ),
          ),
        )
      )
            
    );
  }
  Future<void> logout(BuildContext context) async{

      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
