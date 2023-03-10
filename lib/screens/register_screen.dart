import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/bloc/global/global_bloc.dart';
import 'package:user_app/widgets/text_field_base.dart';

import '../common/enums.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_containte.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  "Create Account",
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
                    Navigator.pushReplacementNamed(context, 'login'),
                child: const Text(
                  "¿Do you already have an account?",
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
  final GlobalKey<FormState> formKey;
  const _LoginForm({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = <String, String>{
      'email': '',
      'password': '',
      'name': '',
      'lastname': '',
      'birthdate': '',
    };
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFieldBase(
                  keyboardType: TextInputType.name,
                  hintText: 'John',
                  labelText: 'Name',
                  prefixIcon: Icons.person,
                  validateText: ValidateText.name,
                  formProperty: 'name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                TextFieldBase(
                  keyboardType: TextInputType.name,
                  hintText: 'Doe',
                  labelText: 'Lastname',
                  prefixIcon: Icons.person,
                  validateText: ValidateText.lastname,
                  formProperty: 'lastname',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                TextFieldBase(
                  keyboardType: TextInputType.datetime,
                  hintText: 'dd/mm/yyyy',
                  labelText: 'Birthdate',
                  prefixIcon: Icons.date_range_outlined,
                  validateText: ValidateText.date,
                  formProperty: 'birthdate',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                TextFieldBase(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Email',
                  prefixIcon: Icons.alternate_email_sharp,
                  validateText: ValidateText.email,
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                TextFieldBase(
                  obscureText: true,
                  hintText: '******',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  validateText: ValidateText.password,
                  keyboardType: TextInputType.text,
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
                      context.read<GlobalBloc>().add(RegisterUser(
                          context: context,
                          password: formValues['password']!,
                          name: formValues['name']!,
                          lastname: formValues['lastname']!,
                          birthdate: formValues['birthdate']!,
                          email: formValues['email']!));
                    }
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      "Continue",
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
