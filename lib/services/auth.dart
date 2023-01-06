import 'package:colorviu/routes/routes.dart';
import 'package:colorviu/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:colorviu/models/user.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      return _userFromFirebaseUser(user);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  Future registerAccount(String email, String password, String fullName,
      String gender, String dof) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      await DatabaseService(uid: user.uid)
          .updateUserData(fullName, gender, dof);
      return _userFromFirebaseUser(user);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      return GetMaterialApp(
        getPages: Routes.routes()
      );
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }
}
