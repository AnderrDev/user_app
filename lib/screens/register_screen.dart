import 'package:flutter/material.dart';

import '../ui/input_decoration.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_containte.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      icon: Icons.person_add,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 170),
            CardContainer(
              child: Column(children: [
                const SizedBox(height: 10),
                Text(
                  "Crear Cuenta",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 30),
                const _LoginForm(),
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'login'),
                child: const Text(
                  "¿Ya tienes una cuenta?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ))
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'John',
                  labelText: 'Nombre',
                  prefixIcon: Icons.person),
              onChanged: (value) => value,
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Doe',
                  labelText: 'Apellido',
                  prefixIcon: Icons.person),
              onChanged: (value) => value,
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '10 Nov 1990',
                  labelText: 'Fecha de Nacimiento',
                  prefixIcon: Icons.date_range_outlined),
              onChanged: (value) => value,
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Correo electronico',
                  prefixIcon: Icons.alternate_email_sharp),
              onChanged: (value) => value,
            ),
            const SizedBox(height: 30),
            TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '******',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => value,
                validator: (value) {
                  return value != null && value.length >= 6
                      ? null
                      : 'La contraseña debe tener 6 caracteres';
                }),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Calle 1 # 2 - 3',
                  labelText: 'Dirección Fisica',
                  prefixIcon: Icons.directions_walk),
              onChanged: (value) => value,
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.indigo,
              onPressed: () async {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  "Ingresar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}
