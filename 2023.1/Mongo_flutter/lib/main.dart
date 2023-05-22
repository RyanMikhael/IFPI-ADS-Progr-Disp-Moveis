import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as Mdb;
import 'db.dart';
import 'package:teste_flutter/model.dart';


void main() async{
  await Database().connectMongo();
  runApp(MaterialApp(
    home: App(),
  ));

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
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  

  var users = Database().getAllDocuments();
  
  insertUser() async{
    final user = User(
      id: Mdb.ObjectId(),
      login: loginController.text,
      password: passwordController.text
    );
    print('passou');

    await Database().addUser(user);
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
                    insertUser(),
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context){
                        return Scaffold(
                          appBar: AppBar(title: Text('Usuarios'), ),
                          body: FutureBuilder<List<Map<String, dynamic>>>(
        future: Database().getAllDocuments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar dados do MongoDB'),
            );
          } else {
            final data = snapshot.data;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item['login']),
                  subtitle: Text(item['password']),
                );
              },
            );
          }
        },
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


