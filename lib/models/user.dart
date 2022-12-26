class MyUser { 
  final String uid;

  MyUser({required this.uid}); 
}

class UserData {
  final String uid;
  final String name;
  final String gender;
  final String dof;

  UserData({required this.uid, required this.name, required this.gender, required this.dof});
}

class ColorUser {
  final String name;
  final String gender;
  final String dof;

  ColorUser({required this.name, required this.gender, required this.dof});
}