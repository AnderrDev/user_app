import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/bloc/global/global_bloc.dart';
import 'package:user_app/common/enums.dart';
import 'package:user_app/widgets/text_field_base.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_containte.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
        body: AuthBackground(
      icon: Icons.person_pin,
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
                _LoginForm(formKey: formKey),
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
                  "Create New Account",
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
  final GlobalKey<FormState> formKey;
  const _LoginForm({Key? key, required this.formKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = <String, String>{
      'username': '',
      'password': '',
    };
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFieldBase(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Email',
                  prefixIcon: Icons.alternate_email_sharp,
                  validateText: ValidateText.email,
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'username',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                TextFieldBase(
                  obscureText: true,
                  hintText: '******',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  validateText: ValidateText.password,
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.indigo,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<GlobalBloc>().add(LoginUser(
                          context: context,
                          password: formValues['password']!,
                          email: formValues['username']!));
                    }
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ));
      },
    );
  }
}
