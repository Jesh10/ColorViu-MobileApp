import 'package:colorviu/models/results.dart';
import 'package:colorviu/results/resultsTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class resultsList extends StatefulWidget {
  const resultsList({super.key});

  @override
  State<resultsList> createState() => _resultsListState();
}

class _resultsListState extends State<resultsList> {
  @override
  Widget build(BuildContext context) {
    final results = Provider.of<List<Results>>(context);
    print(results);
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ResultsTile(results: results[index]);
      },
    );
  }
}
