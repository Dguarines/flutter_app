import 'package:flutter/material.dart';
import '../util/utils.dart' as util;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () => debugPrint("Hey")
            )
        ],
      ),
      body: new Stack(
        children: <Widget>[

          new Center(
            child: new Image.asset('images/umbrella.png',
                width: 490.0,
                height: 1200.0,
                fit: BoxFit.fill ),
          ),

          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text('Spokane',
                style: cityStyle(),),
          ),

          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/light_rain.png'),
          ),

          new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 290.0, 0.0, 0.0),
            child: updateTempWidget("natal"),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String apiId, String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.apiId}&units=imperial';

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
        future: getWeather(util.apiId, city) ,
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          //Where we get all of the json data, we setup widgets
        if(snapshot.hasData){
          Map content = snapshot.data;
          return new Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(content['main']['temp'].toString(),
                  style: new TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 49.9,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),),
                )
              ],
            )
          );
        }else {
          return new Container(

          );
        }
     });
  }
}

TextStyle cityStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}
