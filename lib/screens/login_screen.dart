import 'package:flutter/material.dart';
import '../ui/input_decoration.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_containte.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250),
            CardContainer(
              child: Column(children: [
                const SizedBox(height: 10),
                Text(
                  "Login",
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
                    Navigator.pushReplacementNamed(context, '/register'),
                child: const Text(
                  "Crear una nueva cuenta",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                )),
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
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'john.doe@gmail.com',
                    labelText: 'Correo electronico',
                    prefixIcon: Icons.alternate_email_sharp),
                onChanged: (value) => value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
                }),
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
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              onPressed: () async {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Continuar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}
