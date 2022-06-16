import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final Function()? onTapFunction;
  final Color? bgColor;
  double height;
  double width;

  ButtonWidget(
      {Key? key,
      required this.title,
      required this.onTapFunction,
      required this.bgColor,
        required this.width,
        required this.height
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Ink(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTapFunction!,
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: Text(
              title!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
