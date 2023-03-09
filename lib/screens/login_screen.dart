import 'package:flutter/material.dart';
// import 'package:products/providers/login_form_provider.dart';
// import 'package:products/services/notification_service.dart';
// import 'package:products/ui/input_decoration.dart';
// import 'package:products/widgets/widgets.dart';
// import 'package:provider/provider.dart';

// import '../services/auth_service.dart';
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
                    Navigator.pushReplacementNamed(context, 'register'),
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
    dynamic keyF;

    // final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: keyF,
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
                // loginForm.isLoading = true;

                // final String? errorMessage = await authService.loginUser(
                //     loginForm.email, loginForm.password);
                // if (errorMessage == null) {
                //   Navigator.pushReplacementNamed(context, 'home');
                // } else {
                //   print(errorMessage);
                //   NotificationService.showSnackBar("errorMessage");
                //   loginForm.isLoading = false;
                // }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Espere',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}
