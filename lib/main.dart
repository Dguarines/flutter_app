import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import './ui/welcome_home.dart';


Map _data;

void main() async  {

  _data = await getQuakes();
  print(_data['features'][0]['properties']);

  runApp(
    new MaterialApp(
      title: "Quakes",
      home: new Quakes(),
  ));
}

class Quakes extends StatelessWidget {
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
          itemCount: _data.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, int position) {
            return new ListTile(
              title: new Text("${_data['features'][position]['properties']['place']}"),
            );
          }
        )
      ),
    );
  }
}

Future<Map> getQuakes() async {
  String apiUrl = 'https://earthquakes.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(apiUrl);

  return JSON.decode(response.body);
}