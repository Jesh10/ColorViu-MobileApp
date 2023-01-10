import 'package:colorviu/home.dart';
import 'package:colorviu/tests/d-15/d15_test.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> routes() => [
    GetPage(name: "/", page: () => const Home()),
    GetPage(name: "/d15", page: () => const d15Result()),
  ];
}
