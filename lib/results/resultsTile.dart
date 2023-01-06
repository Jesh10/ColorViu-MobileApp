import 'package:colorviu/models/results.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

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
            onTap: (() {
              print('Ishihara');
            }),
            leading: CircleAvatar(
              radius: 25,
              //backgroundColor: Colors.brown[user.gender],
              backgroundImage: results.test == "Ishihara Test"
                  ? const AssetImage('assets/ishihara.jpeg')
                  : const AssetImage("assets/d15.webp"),
            ),
            title: Text(results.test),
            subtitle: Text(timeago.format(results.dateTime.toDate())),
          ),
        ));
  }
}
