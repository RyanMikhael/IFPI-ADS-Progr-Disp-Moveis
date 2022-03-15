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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
            buildContainer(Colors.red),
            buildColumn(Colors.yellow, Colors.green),
            buildContainer(Colors.blue),
          ],) 
          ),
      )
    );
  }
}

Container buildContainer(Color cor) {
    return Container(
              width: 100,
              height: 100,
              color: cor,         
            );
}

Column buildColumn(Color cor1, Color cor2){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget> [
      buildContainer(cor1),
      buildContainer(cor2),
    ],

  );
}