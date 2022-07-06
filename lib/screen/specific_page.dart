// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class SpecificPage extends StatelessWidget {
  final data;

  const SpecificPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      
      child: Scaffold(
        appBar: null,
        body: 
          Padding(
            padding: EdgeInsets.all(16.0),
            child:Column(
              children: [
                
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                      Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)
                    )
                  ]
                ),
                Container(
                  child:Center(
                    child:Text(
                      data['title'],
                      style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                  )
                  ),
                ),

                Container(
                  alignment: Alignment.topLeft,
                  child: Column(

                    children:[
                      
                      Center(
                        child: Column(
                          children:[
                            
                            const SizedBox(height: 32),

                            Row(
                              children:[
                                Text(
                                  "Campo : ",
                                  style: const TextStyle(fontSize: 15,color: Color(0xFF3c8eec))
                                ),  
                                Text(
                                data['field'],
                                style: const TextStyle(fontSize: 15)
                                ),
                              ]
                            ),
                            
                            const SizedBox(height: 20),

                               
                            Text(
                              data['description'],
                              style: const TextStyle(fontSize: 20),
                            ),
                            

                            const SizedBox(height: 55),

                            Center(child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Color(0xFF3c8eec),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Numero di telefono : " + data['phonenumber'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            )
                            ),

                          ]
                        )
                      )
                    ]
                  ),  
                )
                
              ],
            ),
      ),
      ),
    );

  }
}
