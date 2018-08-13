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
          child: new ListView.builder(
            itemCount: _data.length,
            padding: const EdgeInsets.all(14.5),
            itemBuilder: (BuildContext context, int position){
                return new Column(
                  children: <Widget>[
                    new Divider(height: 5.5),
                    new ListTile(
                      title: Text("${_data[position]['title']}",
                          style: new TextStyle(fontSize: 17.9)),
                      subtitle: Text("${_data[position]['body']}",
                          style: new TextStyle(fontSize: 13.9,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic)),
                      leading: new CircleAvatar(
                        backgroundColor: Colors.greenAccent,
                        child: Text("${_data[position]['body'][0]}",
                        style: new TextStyle(fontSize: 13.4,
                        color: Colors.orangeAccent),),
                      ),
                      onTap: () => _showOnTapMessage(context, _data[position]['body']),
                    )
                  ],
                );
            }),
          ),
        ),
      ),
  );
}

void _showOnTapMessage(BuildContext context, String message){
  var alert = new AlertDialog(
    title: Text("My App"),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },)
    ],
  );
      
  //showDialog(context: context, child: alert);
  showDialog(context: context, builder: (context) {
    return alert;
  });
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