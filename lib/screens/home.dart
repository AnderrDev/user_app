import 'package:flutter/material.dart';
import 'package:user_app/widgets/drawer.dart';

import '../ui/input_decoration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerF(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const _Head(),
            const SizedBox(height: 20),
            const _AddressFormField(),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ListTile(
                        leading: Icon(Icons.map_outlined),
                        title: Text('Calle 54 # 12 - 34'),
                        trailing: Icon(Icons.more_vert));
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}

class _Head extends StatelessWidget {
  const _Head({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Bienvenido a la aplicación de registro de usuarios",
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
      textAlign: TextAlign.center,
    );
  }
}

class _AddressFormField extends StatelessWidget {
  const _AddressFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.streetAddress,
          decoration: InputDecorations.authInputDecoration(
              hintText: 'Cra 54 # 12 - 34',
              labelText: 'Dirección fisica',
              prefixIcon: Icons.streetview_sharp),
          onChanged: (value) => value,
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = RegExp(pattern);
            return regExp.hasMatch(value ?? '')
                ? null
                : 'El valor ingresado no luce como una dirección fisica';
          }),
    );
  }
}
