import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';

class TextFormWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

   const TextFormWidget(
      {Key? key,
        required this.hintText,
        required this.controller,
        required this.keyboardType,
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
            )
        ),
        hintText: hintText,
      ),
      controller: controller,
      keyboardType: keyboardType,
    );
  }
}