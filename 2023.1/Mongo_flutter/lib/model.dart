import 'package:mongo_dart/mongo_dart.dart';

class User{
  final ObjectId id;
  final String email;
  final String password;

  const User({required this.id, required this.email, required this.password});

  Map<String,dynamic> map(){
    return{
      '_id': id,
      'email': email,
      'password': password
    };
  }

  
}