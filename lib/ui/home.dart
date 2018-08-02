import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi>{

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('BMI'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),

        body: new Container(
          alignment: Alignment.center,
          child: new ListView(
            padding: const EdgeInsets.all(2.0),
            children: <Widget>[
              new Image.asset('images/bmilogo.png', height:85.0, width: 75.0),
              
            ],
          ),
        )
      );
  }
}