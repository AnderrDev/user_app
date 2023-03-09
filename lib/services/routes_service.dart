import 'package:flutter/material.dart';
import 'package:user_app/screens/check_auth_screen.dart';
import 'package:user_app/screens/home.dart';
import 'package:user_app/screens/login_screen.dart';
import 'package:user_app/screens/profile_screen.dart';
import 'package:user_app/screens/register_screen.dart';

class RoutesService {
  static const String first = '/';

  static const routes = <Map<String, dynamic>>[
    //ChekAuthScreen
    {
      'route': '/',
      'screen': CheckAuthScreen(),
    },
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
    return MaterialPageRoute(
      builder: (context) => const CheckAuthScreen(),
    );
  }
}
