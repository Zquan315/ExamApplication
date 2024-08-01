import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final TextEditingController? controller;
  final String hintText;
  final FormFieldValidator? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  const InputField({
    super.key,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: Colors.blue),
            suffixIcon: suffixIcon,
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.blue),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900),
              borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }
}
