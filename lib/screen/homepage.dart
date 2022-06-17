// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tutorappalpha/screen/home_screen.dart';
import 'package:tutorappalpha/screen/profilepage.dart';

class HomePage extends StatefulWidget {
  
  HomePage();
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<HomePage> {
  int _currentIndex = 0;

  final  List<Widget> tabs = [
    Center(child: HomeScreen(),),
    Center(child: Text('Search'),),
    Center(child: ProfilePage(),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:tabs[_currentIndex]),
      bottomNavigationBar: 
      /*
        ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),),
          child: */BottomNavigationBar(
            items:[  
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Color(0xFF3c8eec),size: 30),
                    label:"Home",
                    activeIcon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.home)
                    )
                  ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Color(0xFF3c8eec),size: 30),
                    label:"Cerca",
                    activeIcon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.search)
                    )
                  ),
                    
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Color(0xFF3c8eec),size: 30),
                    label:"Profilo",
                    activeIcon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.person)
                    )
                  ),
                  ),
                ],
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xFFA4ABBD),
                showSelectedLabels: false,
                showUnselectedLabels: false,     
                  
                selectedItemColor: Color(0xFF3c8eec),
                unselectedItemColor: Color(0xFF3c8eec),
                selectedLabelStyle: TextStyle(fontSize: 7.0,fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 7.0,fontWeight: FontWeight.bold),
                onTap: (index){
                  setState(() {
                    _currentIndex = index;
                    print(index);
                  });
                },

              ),
      //)
    );
  }
}