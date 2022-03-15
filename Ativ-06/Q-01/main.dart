import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal, 
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
            buildContainer(Colors.blueAccent),
            buildContainer(Colors.red),
            buildContainer(Colors.green),
          ],) 
          ),
      )
    );
  }
}

Container buildContainer(Color cor) {
    return Container(
              width: 100,
              height: 150,
              color: cor,
              child: Text('Hello world!'),            
            );
  }