// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:user_app/common/enums.dart';
import 'package:user_app/common/validate.dart';

import '../ui/input_decoration.dart';

// ignore: must_be_immutable
class TextFieldBase extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  ValidateText? validateText;
  final TextInputType keyboardType;
  final Map<String, String> formValues;
  final String formProperty;

  bool? obscureText;

  TextFieldBase({
    Key? key,
    required this.keyboardType,
    this.validateText,
    this.obscureText = false,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.formValues,
    required this.formProperty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText!,
        autocorrect: false,
        keyboardType: keyboardType,
        decoration: InputDecorations.authInputDecoration(
            hintText: hintText, labelText: labelText, prefixIcon: prefixIcon),
        onChanged: (value) {
          try {
            formValues[formProperty] = value;
          } catch (e) {
            // ignore: avoid_print
            print(e);
          }
        },
        validator: (value) {
          return validateStructure(value);
        });
  }

  validateStructure(String? value) {
    switch (validateText) {
      case ValidateText.name:
        return validateName(value!) ? null : "Invalid name, please try again";
      case ValidateText.lastname:
        return validateName(value!) ? null : "Invalid lastname, please try again";
      case ValidateText.email:
        return validateEmail(value!) ? null : "Invalid email, please try again";
      case ValidateText.password:
        return validatePassword(value!) ? null : "Invalid password, please try again";
      case ValidateText.date:
        return validateDate(value!) ? null : "Invalid date, please try again";
      case ValidateText.address:
        return validateAddress(value!) ? null : "Invalid address, please try again";

      default:
        return null;
    }
  }
}
