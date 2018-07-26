import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.blue,
        child: new Center(
          child: new Text(
            "Welcome Home!!!",
            textDirection: TextDirection.ltr,
            style: new TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                fontSize: 34.5
            ),
          ),
        )
    );
  }
}

class Home extends StatelessWidget {

  void _onPress(){
    print("Search Tapped!");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: new Text("Fency Day"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.send), onPressed: () => debugPrint("Icon Tapped!")),
          new IconButton(icon: new Icon(Icons.search), onPressed: _onPress)
        ],
      ),

      backgroundColor: Colors.grey.shade400,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Bonni",
                style: new TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepOrange
                ),
            ),
            new InkWell(
              child: new Text("Button!"),
              onTap: () => debugPrint("Button Tapped!!"),
            )
          ],
        ),
      ),
  
      floatingActionButton: new FloatingActionButton(
        onPressed: () => debugPrint("Pressed!"),
        backgroundColor: Colors.lightGreen,
        tooltip: 'Going Up!',
        child: new Icon(Icons.call_missed),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: Text("Hey")),
        new BottomNavigationBarItem(icon: new Icon(Icons.print), title: Text("Nope")),
        new BottomNavigationBarItem(icon: new Icon(Icons.call_missed), title: Text("Hello"))
      ],
        onTap: (int i) => debugPrint("Hey Touched $i"),),
    );
  }
}


/*new Container(
color: Colors.greenAccent,
alignment: Alignment.center,
child: new Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
new Text("First item", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.white),),
new Text("Second item", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.blue),),
new Container(
color: Colors.deepOrange.shade50,
alignment: Alignment.bottomLeft,
child: new Text("Third item", textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.blue),),
)
],
),
);*/


/*

child: new Text("Hello Container", textDirection: TextDirection.ltr,
style: new TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18.3),),*/
