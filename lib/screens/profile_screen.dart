import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/bloc/global/global_bloc.dart';
import 'package:user_app/widgets/app_bar.dart';
import 'package:user_app/widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = BlocProvider.of<GlobalBloc>(context);
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        dynamic user = globalBloc.state.user;
        return Scaffold(
            drawer: const DrawerF(),
            appBar: const MyAppBar(title: 'Profile'),
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _ProfileCard(
                          name: user['name'] ?? '',
                          lastname: user['lastname'] ?? '',
                          email: user['username'] ?? ''),
                      const SizedBox(height: 20.0),
                      const Text(
                        "ABOUT",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      const SizedBox(height: 20.0),
                      _Row(
                        icon: Icons.person_add,
                        field: 'Name',
                        value: user['name'] ?? '',
                      ),
                      const _Divider(),
                      _Row(
                        icon: Icons.person_add_sharp,
                        field: 'Lastname',
                        value: user['lastname'] ?? '',
                      ),
                      const _Divider(),
                      _Row(
                        icon: Icons.email,
                        field: 'Email',
                        value: user['username'] ?? '',
                      ),
                      const _Divider(),
                      _Row(
                        icon: Icons.date_range_rounded,
                        field: 'Birthdate',
                        value: user['birthdate'] ?? '',
                      ),
                      const _Divider(),
                    ],
                  ),
                )));
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String lastname;

  const _ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.lastname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0),
      child: Container(
        padding: const EdgeInsets.only(top: 20, right: 15, bottom: 6),
        child: Row(
          children: [
            Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color(0xff655DC6)]),
                ),
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 23,
                    child: Icon(Icons.person),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$name $lastname',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.verified,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  email,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String field;
  final String value;
  final IconData icon;
  const _Row({
    Key? key,
    required this.field,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.indigo,
          ),
          const SizedBox(width: 20.0),
          Text(
            '$field: ',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
