import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'second.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Preference",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _controller = new TextEditingController();

  Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
Future<Null> addString() async {
  final SharedPreferences prefs = await _sPrefs;
prefs.setString("name", _controller.text);

setState(() {
  _controller.text = '';

});  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter String ..."),
            ),
          ),
          RaisedButton(
            onPressed: () {
             addString();
             Navigator.push(context, MaterialPageRoute(
               builder: (context) => SecondPage()
             
             ),);
            },
            child: Text("Add & Next"),
          ),
         
        ],
      ),
    );
  }
}
  /*
  void saveName(){
    String name = _controller.text;
    saveNamePreference(name).then((bool committed){
Navigator.push(context, MaterialPageRoute(
  builder: (context) => new SecondPage()
));
    }); 
  }
}
  Future<bool> saveNamePreference(String name) async {
     
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString("name", name);
print(name + " get");
return prefs.commit();

  }

  Future<String> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("name");
    return name;
  }

*/
