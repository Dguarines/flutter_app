import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import './ui/welcome_home.dart';


List _data;
//List _features;

void main() async  {

  _data = await getJson();

  String _body = "";

  //print(_data); //just a string

  for(int i = 0; i < _data.length; i++){
    print(_data[i]['title'] + " body: " + _data[i]['body']);
  }

  _body = _data[0]['body'];

  runApp(new MaterialApp(
      title: "JSON PARSE",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('JSON Parse'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: new Center(
          child: new Text(_body),
        ),
      ),
  ));
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body); // returns a List type
}

/*class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: new Center(
        child: new ListView.builder(
          itemCount: 1,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, int position) {
            return new ListTile(
              title: new Text("${_data[position]}"),
            );
          }
        )
      ),
    );
  }
}*/