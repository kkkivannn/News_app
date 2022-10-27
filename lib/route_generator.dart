import 'package:flutter/material.dart';
import 'package:news_app/feature/presentation/news_view/view/news_view.dart';

import 'feature/presentation/home/view/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/NewsViewPage':
        final arguments = settings.arguments as Map<String, dynamic>;
        if (arguments['title'] is String &&
            arguments["content"] is String &&
            arguments['url'] is String &&
            arguments['isSaved'] is bool) {
          return MaterialPageRoute(
            builder: (context) => NewsView(
              title: arguments['title'] as String,
              content: arguments['content'] as String,
              url: arguments['url'] as String,
              isSaved: arguments['isSaved'] as bool,
            ),
          );
        } else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(
        child: Text('Error!'),
      ),
    );
  });
}
