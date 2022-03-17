import 'package:flutter/material.dart';

void main(){
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Count'),
          backgroundColor: Color(0xFF27D3A8),
        ),
        body: homePage(),
        backgroundColor: Colors.white,
        
      ),
    )
  );
}

class homePage extends StatefulWidget{
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int count = 0;

  void incrementar(){
    setState(() {
      count++;
    });
  }

  void decrementar(){
    setState(() {
      if(count >=1){
        count--;
      }
    });
  }

  @override 
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            'Incremente ou decremente do numero na tela',
            style: TextStyle(
            fontSize: 16,
            ),
          ),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 60,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 12),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: incrementar, 
                    child: Icon(Icons.add),),
                  SizedBox(
                    height: 6,
                  ),
                  FloatingActionButton(
                    onPressed: decrementar,
                    child: Icon(Icons.remove),
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          
        ]),

    
    ); 
  }
}
