import 'package:colorviu/models/results.dart';
import 'package:flutter/material.dart';

class ResultsTile extends StatelessWidget {

  final Results results;
  const ResultsTile({super.key, required this.results});

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
            backgroundImage: AssetImage('assets/ishihara.jpeg'),
            ),
            title: Text(results.test),
            subtitle: Text(results.severity),
        ),
      )
    );
  }
}