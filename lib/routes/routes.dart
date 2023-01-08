import 'package:colorviu/results/retrieveResults.dart';
import 'package:colorviu/screens/home/home.dart';
import 'package:colorviu/tests/d-15/d15_test.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> routes() => [
    GetPage(name: "/", page: () => Home()),
    GetPage(name: "/d15", page: () => d15Result()),
  ];
}
