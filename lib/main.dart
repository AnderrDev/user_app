import 'package:flutter/material.dart';
import 'package:user_app/bloc/global/global_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/services/app_routes.dart';
import 'package:user_app/ui/theme.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalBloc>(
          create: (_) => GlobalBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User App',
      theme: theme(),
      initialRoute: AppRoutes.first,
      routes: AppRoutes.getRoutes(),
      onGenerateRoute: AppRoutes.generateRoutes,
    );
  }
}
