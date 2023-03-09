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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250),
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
    dynamic keyF;
    return Form(
        key: keyF.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // ignore: todo
        //TODO mantener la referencia al Key
        child: Column(
          children: [
            TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'john.doe@gmail.com',
                    labelText: 'Correo electronico',
                    prefixIcon: Icons.alternate_email_sharp),
                onChanged: (value) => keyF.email = value,
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
                onChanged: (value) => keyF.password = value,
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
                // final authService =
                //     Provider.of<AuthService>(context, listen: false);
                // if (!loginForm.isValidForm()) return;

                // final String? errorMessage = await authService.createUser(
                //     loginForm.email, loginForm.password);

                // if (errorMessage == null) {
                //   Navigator.pushReplacementNamed(context, 'home');
                // } else {
                //   print(errorMessage);
                // }
                // loginForm.isLoading = true;
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  "Ingresar",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}
