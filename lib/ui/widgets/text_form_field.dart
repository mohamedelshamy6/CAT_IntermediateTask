import 'package:flutter/material.dart';

class CustomTff extends StatelessWidget {
  const CustomTff(
      {Key? key,
      required this.controller,
      required this.title,
      required this.validatorText})
      : super(key: key);

  final TextEditingController controller;
  final String title;
  final String validatorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      controller: controller,
      obscureText: title == 'Password' || title == 'Password Confirmation'
          ? true
          : false,
      keyboardType: keyboard(),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color(0xff1E3163)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff2D46B9),
          ),
        ),
        labelText: title,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff2D46B9),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff2D46B9),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xff2D46B9),
          ),
        ),
      ),
    );
  }

  TextInputType keyboard() {
    if (title == 'Email') {
      return TextInputType.emailAddress;
    } else if (title == 'Password') {
      return TextInputType.visiblePassword;
    } else if (title == 'Password Confirmation') {
      return TextInputType.visiblePassword;
    } else if (title == 'First Name') {
      return TextInputType.text;
    } else if (title == 'Last Name') {
      return TextInputType.text;
    } else if (title == 'Phone') {
      return TextInputType.phone;
    } else {
      return TextInputType.text;
    }
  }
}
