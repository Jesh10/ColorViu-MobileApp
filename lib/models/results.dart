import 'package:cloud_firestore/cloud_firestore.dart';

class Results {
 String uid;
 String test;
 String result;
 String severity;
 Timestamp dateTime;

  Results({
    required this.uid,
    required this.test,
    required this.result,
    required this.severity,
    required this.dateTime,
  });
}