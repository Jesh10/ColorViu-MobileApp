import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorviu/models/results.dart';
import 'package:colorviu/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference resultCollection =
      FirebaseFirestore.instance.collection('results');

  Future updateUserData(String fullName, String gender, String dof) async {
    return await userCollection.doc(uid).set({
      'name': fullName,
      'gender': gender,
      'dof': dof,
    });
  }

  Future createResult(String uid, String test, String result, String severity,
      DateTime datetime) async {
    return await resultCollection.doc().set({
      'uid': uid,
      'test': test,
      'result': result,
      'severity': severity,
      'datetime': datetime,
    });
  }

  List<ColorUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ColorUser(
          name: doc.get('name') ?? '',
          gender: doc.get('gender') ?? '',
          dof: doc.get('dof') ?? '');
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot['name'],
        gender: snapshot['gender'],
        dof: snapshot['dof']);
  }

  Results _resultsDataFromSnapshot(DocumentSnapshot snapshot) {
    return Results(
        uid: uid,
        test: snapshot['test'],
        result: snapshot['result'],
        severity: snapshot['severity'],
        dateTime: snapshot['datetime']);
        
  }

  Stream<List<ColorUser>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<Results> get resultsData {
    return userCollection.doc(uid).snapshots().map(_resultsDataFromSnapshot);
  }
}
