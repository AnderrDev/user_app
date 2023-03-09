import 'package:flutter/material.dart';
import 'package:user_app/screens/home.dart';
import 'package:user_app/screens/login_screen.dart';
import 'package:user_app/screens/profile_screen.dart';
import 'package:user_app/screens/register_screen.dart';

class AppRoutes {
  static const String first = '/profile';

  static const routes = <Map<String,dynamic>> [
    // Homme
    {
      'route': '/home',
      'screen': HomeScreen(),
    },
    // LogIn
    {
      'route': '/login',
      'screen': LoginScreen(),
    },
    // Profile
    {
      'route': '/profile',
      'screen': ProfileScreen(),
    },
    // Register
    {
      'route': '/register',
      'screen': RegisterScreen(),
    },
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (var route in routes) {
      appRoutes[route['route']] = (context) => route['screen'];
    }
    return appRoutes;
  }

  // Generator of routes
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
