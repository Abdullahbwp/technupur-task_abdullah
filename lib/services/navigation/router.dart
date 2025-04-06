import 'package:flutter/material.dart';
import 'package:technupur_abdullha/home_page/view/home_page.dart';
import 'router_path.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print("setting......${settings.name}");
  switch (settings.name) {
    case RouterPath.home_page:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
