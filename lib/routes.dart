import 'package:get/get.dart';
import 'package:untitled/screens/home/home_screen.dart';

class AppRoutes {

  static const String home = '/home';


  static final routes = [

    GetPage(name: home, page: () => const HomeScreen()),

    // Add more routes as needed
  ];
}
