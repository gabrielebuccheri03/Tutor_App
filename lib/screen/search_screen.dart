// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorappalpha/screen/specific_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Future<String> getData() async{

    http.Response response = await http.get(
      Uri.parse("https://aqueous-everglades-78338.herokuapp.com/ads"),
      headers: {
        "Accept": "application/json"
      }
    );

    print(response.body);
    return response.body;

  }

class _HomeScreenState extends State<SearchScreen> {
  List<String> foodList = [
    'Matematica',
    'Berries',
    'Lemons',
    'Apples',
    'Mangoes',
    'Dates',
    'Avocados',
    'Black Beans',
    'Chickpeas',
    'Pinto beans',
    'White Beans',
    'Green lentils',
    'Split Peas',
    'Rice',
    'Oats',
    'Quinoa',
    'Pasta',
    'Sparkling water',
    'Coconut water',
    'Herbal tea',
    'Kombucha',
    'Almonds',
    'Peannuts',
    'Chia seeds',
    'Flax seeds',
    'Canned tomatoes',
    'Olive oil',
    'Broccoli',
    'Onions',
    'Garlic',
    'Carots',
    'Leafy greens',
    'Meat',
  ];
  
  List<String>? foodListSearch;
  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*fetchNotes().then((value){
      setState(() {
        _notes.addAll(value);
      });
    });*/
    return Scaffold(
      body: _textEditingController!.text.isNotEmpty &&
              foodListSearch!.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search_off,
                        size: 160,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'No results found,\nPlease try different keyword',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            )
    : Padding(
        padding: const EdgeInsets.only(top: 36.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: FutureBuilder<String>(
          future: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              Map data = jsonDecode(snapshot.data!);
              return adsList(data: data);
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          }
        ),
      )
    );
  }
}

class adsList extends StatelessWidget {
  const adsList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data["rows"].length,
      itemBuilder: (context,index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Icon(Icons.book_rounded),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificPage(data: data['rows'][index])));
                },
                child: Column(
                  children: [
                    Text(data['rows'][index]['title'],style: TextStyle(fontSize: 20),),
                    Text(data['rows'][index]['field'])
                  ],
                ),
              )  
            ],
          ),
        );
      }
    );
  }
}