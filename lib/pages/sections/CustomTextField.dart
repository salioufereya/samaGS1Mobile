import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isObscure;
  final Function(String) onChanged;
  final String Function(String?)? validator;
  final bool isEmailValid;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.isObscure,
    required this.onChanged,
    required this.validator,
    required this.isEmailValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        obscureText: isObscure,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: Colors.black87),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: isEmailValid ? Colors.green : Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
