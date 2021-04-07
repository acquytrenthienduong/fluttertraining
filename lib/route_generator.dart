import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyStatefulWidget());
      case 'enter-name':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => EnterNamePage());
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('ERROR')),
        body: Center(child: Text('ERROR')),
      );
    });
  }
}
