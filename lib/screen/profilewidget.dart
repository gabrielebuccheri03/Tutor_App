// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';
class ProfileWidget extends StatelessWidget{
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath, 
    required this.onClicked,
  }): super(key : key);

  @override
  Widget build (BuildContext context){
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child:Container(
      margin: EdgeInsets.only(top:75),
      child:Stack(
        children:[
          buildImage(),
          Positioned(
            bottom:0,
            right:4,
            child: buildEditIcon(color),
          )
        ] 
      ) 
      )
    );
  }

  Widget buildImage(){
    final image = NetworkImage(imagePath);
    return ClipOval(
      child: Material(
         child: Ink.image(
          image:image,
          width: 128,
          height: 128,
          fit: BoxFit.cover,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );

  }
  
  Widget buildEditIcon(Color color) => buildCircle(
    color:Colors.white,
    all:3,
    child:buildCircle(
      color: color,
      all:8,
      child:Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    )
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  })=>
      ClipOval(
        child:Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

}