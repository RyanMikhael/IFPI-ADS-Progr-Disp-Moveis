import 'package:mongo_dart/mongo_dart.dart';

import 'model.dart';
class Database{
  var db, userCollection;
  Future<Db> connectMongo() async {
    db = await Db.create('mongodb+srv://ryanmikhael:ReNWdJgHqiTJcyeE@cluster0.nnfphmj.mongodb.net/teste?retryWrites=true&w=majority');

    await db.open();
    print('passou');
    userCollection = await db.collection('users');
    return db;
  }

  Future<List<Map<String, dynamic>>> getAllDocuments() async {
    var db = await connectMongo();
    var userCollection = await db.collection('users');

    var users = await userCollection.find().toList();
    // print(users);
    await db.close();
    return users;
  }

  addUser(User user) async {
    var db = await connectMongo();
    var userCollection = await db.collection('users');

    await userCollection.insert(user.map());

    await db.close();


  }
}