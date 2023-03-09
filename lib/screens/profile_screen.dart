import 'package:flutter/material.dart';
import 'package:user_app/widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerF(),
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  _ProfileCard(),
                  SizedBox(height: 20.0),
                  SizedBox(height: 20.0),
                  _Row(),
                  _Divider(),
                  _Row(),
                  _Divider(),
                  _Row(),
                  _Divider(),
                  _Row(),
                  _Divider(),
                  _Row(),
                  _Divider(),
                  _Row(),
                ],
              ),
            )));
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
  const _ProfileCard({
    Key? key,
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
                  children: const [
                    Text(
                      'John Doe',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.verified,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'John.doe@gmail.com',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
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
  const _Row({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Nombre: ',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Juan Perez',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
