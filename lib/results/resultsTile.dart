import 'package:colorviu/models/results.dart';
import 'package:colorviu/results/showD15.dart';
import 'package:colorviu/results/showIshihara.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:convert';

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
            if (results.test == 'Ishihara Test') {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (ctx) => ShowIshihara(
                  result: results.score,
                  questionLength: 16,
                  deficiency: results.result,
                  statement: results.severity,
                )
              );
            } else if (results.test == 'D-15 Arrangement Test') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowD15(
                    deficiency: results.result,
                    statement: results.severity,
                    result: json.decode(results.score),
                  ),
                )
              );
            }
          }),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: results.test == "Ishihara Test"
              ? const AssetImage('assets/ishihara.jpeg')
              : const AssetImage("assets/d15.webp"),
          ),
          title: Text(results.test),
          subtitle: Text(timeago.format(results.dateTime.toDate())),
        ),
      )
    );
  }
}
