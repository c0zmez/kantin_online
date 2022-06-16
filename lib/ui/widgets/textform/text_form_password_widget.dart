import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';

class TextFormPassword extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool obscureText;

  const TextFormPassword(
      {Key? key,
        required this.hintText,
        required this.controller,
        required this.suffixIcon,
        required this.obscureText,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: colorGrey),
        border: const OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 2)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: colorRed,
            width: 2,
          ),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon
      ),
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
    );
  }
}