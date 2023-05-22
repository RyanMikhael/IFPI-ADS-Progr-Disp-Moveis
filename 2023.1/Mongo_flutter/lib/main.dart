import 'package:flutter/material.dart';
import 'package:mdb/db.dart';
import 'package:mdb/model.dart';
import 'package:mdb/users_page.dart';
import 'package:mongo_dart/mongo_dart.dart' as MongoDb;

void main() {
  Database().connectMongo();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  insertUser() async{
    var user = User(id: MongoDb.ObjectId(), email: emailController.text, password: passwordController.text);
    await Database().addUser(user);
  }
  

  @override
  Widget build(BuildContext context) {
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
                // Image(
                //   image: AssetImage(
                //     'images/i489928.webp'
                //   ),
                //   width: 200.0,
                //   height: 200.0,
                // ),
                Container(
                    height: 30.0,
                  ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Login'
                  ),
                  controller: emailController,
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
                    insertUser(),
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context){
                        return Scaffold(
                          appBar: AppBar(title: Text('Usuarios'), ),
                          body: UserList()
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
