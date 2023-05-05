import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main(){
  runApp(MaterialApp(
    home: App(),
  ));
}

int idUser;

_openBanco() async {
  var dataBasePath = await getDatabasesPath();
  String path = join(dataBasePath, 'banco.db');
  var bd = await openDatabase(path, version: 1,
  onCreate: (db, versaoRecente) async{
    String sql = "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT,login VARCHAR, password VARCHAR )";
    await db.execute(sql);
  });
  
  print('Banco: ' + bd.isOpen.toString());
  return bd;
}

_salvar(login, password) async {
  Database db = await _openBanco();
  Map<String, dynamic> dataUser = {
    'login': login,
    'password': password
  };
  Future(() async {
    idUser = await db.insert('users',dataUser);
    
  });

  print(idUser);
}

_listar() async {
  Database db = await _openBanco();
  Future<List<Map<String, dynamic>>> queryAllRows() async {

    return await db.query('banco.db');
  }
}


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  

  var users= [];

  cadastrarUsuarios(){
    setState(() {
      String login = loginController.text;
      String password = passwordController.text;

      users.add([login, password]);
      _salvar(login, password);

    });
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('CrudApp'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320.0,
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(
                    'images/i489928.webp'
                  ),
                  width: 200.0,
                  height: 200.0,
                ),
                Container(
                    height: 30.0,
                  ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Login'
                  ),
                  controller: loginController,
                ),
                Container(
                    height: 30.0,
                  ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha'
                  ),
                  controller: passwordController,

                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () => {
                    _listar(),
                    cadastrarUsuarios(),
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context){
                        return Scaffold(
                          appBar: AppBar(title: Text('Usuarios'), ),
                          body: Center(
                            child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (BuildContext context, int index){
                              return Container(
                                height: 50,
                                  child: Column(
                                    children: [
                                      Text('${users[index][0]}'),
                                      Text('${users[index][1]}')

                                    ],
                                  ),
                                );
                              }
                            ),
                          ),
                        );
                      }
                    ))
                  },
                  child: Text('Cadastrar'),
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
