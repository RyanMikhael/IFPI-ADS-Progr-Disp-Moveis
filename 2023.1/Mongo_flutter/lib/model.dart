
import 'package:mongo_dart/mongo_dart.dart';

class User{
  final ObjectId id;
  final String login;
  final String password;

  const User({
    this.id, this.login, this.password, 
  });

  Map<String, dynamic> map(){
    return {
      '_id': id,
      'login': login,
      'password': password
    };
    
  }


}

