import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/bloc/global/global_bloc.dart';

import '../screens/home.dart';
import '../screens/profile_screen.dart';

class DrawerF extends StatelessWidget {
  const DrawerF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(20, 20, 126, 1),
                  Color.fromRGBO(75, 63, 126, 1)
                ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Color.fromRGBO(75, 63, 126, 1),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 26,
                        child: Icon(
                            color: Color.fromRGBO(75, 63, 126, 1),
                            Icons.person),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'USER APP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {
                  context.read<GlobalBloc>().add(SignOut(context));
                },
                leading: const Icon(Icons.logout),
                title: const Text('Log out'),
              ),
            ],
          ),
        );
      },
    );
  }
}
