import 'package:flutter/material.dart';
import 'package:wiztok/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final IconData icon;
  final bool isObscured;
  const TextInputField({
    super.key,
    required this.textController,
    required this.labelText,
    required this.icon,
    required this.isObscured,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(
          fontSize: 25,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      obscureText: isObscured,
    );
  }
}
