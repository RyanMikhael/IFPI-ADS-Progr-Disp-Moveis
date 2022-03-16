import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
        backgroundColor: Colors.red
      ),
    )
  );
}


class DicePage extends StatefulWidget{
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int numeroDaEsquerda = 1;
  int numeroDaDireita = 1;

  void alterarDado(){
    setState(() {
      numeroDaEsquerda = Random().nextInt(6) + 1;
      numeroDaDireita = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context){
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Image(
                image: AssetImage('images/dice$numeroDaEsquerda.png'),
              ),
              onPressed: () {
                alterarDado();
                print('Botão pressionado');
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Image(
                image: AssetImage('images/dice$numeroDaDireita.png')
              ),
              onPressed: () {
                alterarDado();
                print('Botão pressionado');
              },
            )
          )
        ]),

    );
  }
}