import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: prefer_const_constructors

class CreateAd extends StatefulWidget {
  const CreateAd({Key? key}) : super(key: key);

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";

  @override
  
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final TitleController= TextEditingController();
    final DescriptionController= TextEditingController();
    final FieldController= TextEditingController();
    final PhoneNumberController= TextEditingController();
    return Scaffold(
      body:Container(
      padding: const EdgeInsets.only(left: 40, right: 40,top: 40),
        child: Form(
          key: formKey, //key for form
          child:SingleChildScrollView(
            reverse: true,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Crea il tuo", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                Text("annuncio !", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                SizedBox(height: height*0.03,),
                TextFormField(
                  controller: TitleController,
                  decoration: InputDecoration(
                    labelText: "Titolo dell'annuncio",
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                      return "Inserisci un nome adatto (a-z, A-Z)";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.03,),
                TextFormField(
                  controller: DescriptionController,
                  decoration: InputDecoration(
                    labelText: "Descrizione dell'annuncio",
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                      return "Inserisci una descrizione adatta (a-z, A-Z)";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.03,),
                TextFormField(
                  controller: FieldController,
                  decoration: InputDecoration(
                    labelText: "Ambito",
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                      return "Inserisci un Ambito adatto (a-z, A-Z)";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.03,),
                TextFormField(
                  controller: PhoneNumberController,
                  decoration: InputDecoration(
                    labelText: "Numero di telefono",
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^(([+]|00)39)?((3[1-9][0-9]))(\d{7})$').hasMatch(value)){ //  es 3388002120
                      return "Inserisci un numero di telefono corretto";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.1,),
                Row(
                  children: [
                    Text("Pubblica",style: TextStyle(fontSize: 22, color: Color(0xFF363f93)),),
                    Padding(
                      padding: const EdgeInsets.only(left: 160.0),
                        child:FloatingActionButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            final snackBar = SnackBar(content: Text("Pubblicato"));
                            Scaffold.of(context).showSnackBar(snackBar);
                            sendData(TitleController.text, DescriptionController.text, FieldController.text, PhoneNumberController.text);
                            TitleController.clear();
                            DescriptionController.clear();
                            FieldController.clear();
                            PhoneNumberController.clear();
                          }
                        },
                        backgroundColor: Color(0xFF363f93),
                        child: const Icon(Icons.send),
                      ),
                    )
                  
                  ],
                ),
                SizedBox(height: height*0.02,),
              ],
            )
          )
        )
    ));
  }

  sendData(title,description,field,phonenumer) async{
    try{

      var response = await http.post(
        Uri.parse("https://aqueous-everglades-78338.herokuapp.com/ads"),
        body: {
          "title" : title,
          "description" : description,
          "field" : field,
          "phoneNumber" : phonenumer
        }
      );

      print(phonenumer.replaceAll((' '),''));

    }
    catch(e){
      print(e);
    }

  }

}