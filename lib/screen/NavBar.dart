// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tutorappalpha/GlobalVariables.dart' as globals;

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFA4ABBD),
      child:ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text("${globals.user.firstName} ${globals.user.secondName}"), 
            accountEmail: Text("${globals.user.email}"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/zyzzpic.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,

                ),
                
              )
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(
                  "assets/gym.jpg"
                ),
                fit: BoxFit.cover,

              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFF3c8eec),),
            title:Text("Profilo",style: TextStyle(color: Color(0xFF3c8eec))),
            // ignore: avoid_print
            onTap: ()=> {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Color(0xFF3c8eec),),
            title:Text("Impostazioni",style: TextStyle(color: Color(0xFF3c8eec))),
            // ignore: avoid_print
            onTap: ()=> {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,color: Color(0xFF3c8eec),),
            title:Text("Esci",style: TextStyle(color: Color(0xFF3c8eec))),
            // ignore: avoid_print
            onTap: ()=> {},
          ),
          
        ],
      )
    );
  }
}