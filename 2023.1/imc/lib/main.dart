import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>{

  var msg = 'Info';

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void refresh(){
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      msg = 'Insira os dados necessários';
    });

  }

  void calcularIMC(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;

      double imc = peso / (altura* altura);

      if(imc < 18.6){
        print('Abaixo do peso');
        msg = 'Abaixo do peso';
      }
      else if(imc >= 18.6 && imc <= 24.6){
        print('Peso ideal');
        msg = 'Peso ideal';
      }
      else if(imc >= 25 && imc <= 29.9){
        print('Levemente acima do peso');
        msg = 'Levemente acima do peso';
      }
      else if(imc >= 30 && imc <= 34.9){
        print('Obsedidade grau I');
        msg = 'Obsedidade grau I';
      }
      else if(imc >= 35 && imc <= 39.9){
        print('Obsedidade grau II');
        msg = 'Obsedidade grau II';
      }
      else if(imc >= 40){
        print('Obsedidade grau III');
        msg = 'Obsedidade grau III';
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget> [
          IconButton(onPressed: refresh,
           icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso(kg)',
                labelStyle: TextStyle(color: Colors.green, fontSize: 25.0),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: pesoController,
              ),
      
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura(cm)',
                labelStyle: TextStyle(color: Colors.green, fontSize: 25.0),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: alturaController,
              ),
            
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ElevatedButton(
                  onPressed: calcularIMC,
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 25.0,),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ),
            ),
      
            Text(msg,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            ),
      
            
      
            
          ],
        ),
      )
    );
  }
}