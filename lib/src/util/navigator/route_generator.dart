import 'package:flutter/material.dart';
import 'package:flutter_school/src/features/home/home_page.dart';
import 'package:flutter_school/src/features/patrimonio/pages/patrimonio_list_page.dart';
import 'package:flutter_school/src/features/patrimonio/pages/patrimonio_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/patrimonio':
        return MaterialPageRoute(builder: (context) => PatrimonioListPage());
      case '/patrimonio/detail':
        final id = settings.arguments as String?;
        return MaterialPageRoute(builder: (context) => PatrimonioPage(id: id));

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("Not found ${settings.name}"),
                  ),
                ));
    }
  }
}
