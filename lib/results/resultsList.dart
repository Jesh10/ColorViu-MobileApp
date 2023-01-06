import 'package:colorviu/models/results.dart';
import 'package:colorviu/models/user.dart';
import 'package:colorviu/results/resultsTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class resultsList extends StatefulWidget {
  const resultsList({super.key});

  @override
  State<resultsList> createState() => _resultsListState();
}

late String userid;

// ignore: camel_case_types
class _resultsListState extends State<resultsList> {
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<MyUser>(context);
    userid = uid.uid;
    final results = Provider.of<List<Results>>(context);
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        if (results[index].uid == userid) {
          return ResultsTile(results: results[index]);
        } else {
          return Container();
        }
      },
    );
  }
}
