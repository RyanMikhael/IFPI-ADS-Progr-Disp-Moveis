import 'package:flutter/material.dart';
import 'package:mdb/db.dart';

class UserList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: Database().getAllDocuments(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),

          );
        }
        else if(snapshot.hasError){
          return Center(
            child: Text('Falha ao carregar os dados'),
          );
        }
        else{
          final users = snapshot.data;

          return ListView.builder(
            itemCount: users!.length,
            itemBuilder:(context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['email']),
                subtitle: Text(user['password']),
                
              );
            },
          );
        }
      }
    );
  }
}