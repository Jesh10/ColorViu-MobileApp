import 'package:colorviu/routes/routes.dart';
import 'package:colorviu/screens/authenticate/authenticate.dart';
import 'package:colorviu/services/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:colorviu/models/user.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return VerifyEmail();
      // return GetMaterialApp(
      //   getPages: Routes.routes()
      // );
    }
  }
}
