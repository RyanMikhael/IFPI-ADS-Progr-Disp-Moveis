import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({Key ? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF453CC9),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                myPhoto(),
                Text(
                  'Ryan Mikhael',
                  style: TextStyle(
                    fontSize: 37,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Student of the systems analysis and development',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),

                buildCard('Telefone de contato', Icons.whatsapp),
                buildCard('Email', Icons.email_outlined),
                buildCard('Facebook', Icons.facebook),
                
              ],
            ),
          ) ,
        ),
      )
    );
  }
}

CircleAvatar myPhoto(){
  return CircleAvatar(
    radius: 70,
    backgroundColor: Color(0xFFD4E8FF),
    child: CircleAvatar(
      radius: 65,
      backgroundImage: AssetImage('images/my-photo.jpg'),
    ),
    
  );
}

Card buildCard(String text, IconData icon){
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
    color:Color(0xFF22AFF1) , 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ),
  );
}
