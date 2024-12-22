import 'package:flutter/material.dart';

import '../presentation/home_page.dart';
import '../presentation/test_page.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String testPage = '/testPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // print('Routes Data : ${settings.arguments}');
    // var data = settings.arguments;
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case testPage:
        return MaterialPageRoute(
          builder: (context) => const TestPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
