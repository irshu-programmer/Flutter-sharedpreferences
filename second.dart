import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: MySecondPageHome(),
    );
  }
}
class MySecondPageHome extends StatefulWidget {
  @override
  _MySecondPageHomeState createState() => _MySecondPageHomeState();
}

class _MySecondPageHomeState extends State<MySecondPageHome> {
String name ;
Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
  Future<Null> getString() async {
     final SharedPreferences prefs = await _sPrefs;
  setState(() {
    
  name = prefs.getString("name");
  });
}
@override
  void initState() {
    getString();
    super.initState();
  }
   updateName(){
setState(() {
  this.name = name;
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text("You enterd $name"),
      ),
    );
  }
   
}