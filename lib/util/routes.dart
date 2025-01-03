import 'package:flutter/material.dart';

import '../features/products/presentation/views/add_product.dart';
import '../features/products/presentation/views/all_categories.dart';
import '../features/products/presentation/views/categories.dart';
import '../features/products/presentation/views/products_home.dart';
import '../features/products/presentation/views/update_product.dart';
import '../presentation/home_page.dart';
import '../presentation/test_page.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String testPage = '/testPage';
  static const String productsHome = '/ProductsHome';
  static const String allCategories = '/AllCategories';
  static const String categories = '/Categories';
  static const String addProduct = '/AddProduct';
  static const String updateProduct = '/UpdateProduct';

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
      case productsHome:
        return MaterialPageRoute(
          builder: (context) => const ProductsHome(),
        );
      case allCategories:
        return MaterialPageRoute(
          builder: (context) => const AllCategories(),
        );
      case categories:
        return MaterialPageRoute(
          builder: (context) => const Categories(),
        );
      case addProduct:
        return MaterialPageRoute(
          builder: (context) => const AddProduct(),
        );
      case updateProduct:
        return MaterialPageRoute(
          builder: (context) => const UpdateProduct(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
