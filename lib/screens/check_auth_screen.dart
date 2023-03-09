import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/bloc/global/global_bloc.dart';
import 'package:user_app/screens/home.dart';
import 'package:user_app/screens/login_screen.dart';
import 'package:user_app/services/storage_service.dart';


class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: StorageService.getProperty('token'),
        builder: (context, snapshot) {
          final GlobalBloc globalBloc = BlocProvider.of<GlobalBloc>(context);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              globalBloc.add(SetIsLoading(true));
              globalBloc.add(AuthTokenUser(snapshot.data ?? ''));
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const HomeScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Future.microtask(() {
                globalBloc.add(SetIsLoading(true));
                globalBloc.add(SignOut());
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LoginScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }
}
