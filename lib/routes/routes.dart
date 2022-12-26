import 'package:colorviu/screens/home/home.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> routes() => [
    GetPage(name: "/", page: () => Home()),
  ];
}
