import 'package:flutter/material.dart';

import '../ui/input_decoration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(children: [
            Text(
              "Bienvenido a la aplicación de registro de usuarios",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const _AddressFormField()
          ]),
        ),
      ),
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
