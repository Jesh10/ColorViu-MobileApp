import 'package:flutter/material.dart';
import 'package:colorviu/models/user.dart';

class UserTile extends StatelessWidget {

  final ColorUser user;
  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            //backgroundColor: Colors.brown[user.gender],
            backgroundImage: AssetImage('assets/_DSC0038.jpg'),
            ),
            title: Text(user.name),
            subtitle: Text('Takes ${user.gender} sugar(s)'),
        ),));
      
  }
}
