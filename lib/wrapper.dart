import 'package:colorviu/authenticate/authenticate.dart';
import 'package:colorviu/services/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:colorviu/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return VerifyEmail();
    }
  }
}
