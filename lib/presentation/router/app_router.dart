import 'package:bloc_flutter/presentation/screens/home_screen.dart';
import 'package:bloc_flutter/presentation/screens/second_screen.dart';
import 'package:bloc_flutter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  title: "Home Screen",
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                  title: "Second Screen",
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(
                  title: "Third Screen",
                ));

      default:
        return null;
    }
  }
}
