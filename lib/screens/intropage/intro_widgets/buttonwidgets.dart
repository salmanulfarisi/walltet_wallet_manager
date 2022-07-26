import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  final String? buttonText;
  final void Function() buttonAction;
  final Color? buttonColor;
  final double? buttonTextSize;
  final Color? buttonTextColor;

  const ButtonWidgets(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.buttonTextSize,
      this.buttonTextColor,
      required this.buttonAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.black),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        primary: buttonColor,
        textStyle:
            TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.bold),
      ),
      onPressed: buttonAction,
      child: Text(
        buttonText!,
        style: TextStyle(color: buttonTextColor),
      ),
    );
  }
}
