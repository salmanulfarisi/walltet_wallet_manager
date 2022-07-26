import 'package:flutter/material.dart';

class TextWidgets extends StatelessWidget {
  final String text;
  final double? textsize;
  // final String? textfontweight;
  final Color? textcolor;
  final FontWeight? textFontWeight;
  final TextAlign? textAlign;

  const TextWidgets(
      {Key? key,
      required this.text,
      this.textcolor,
      this.textAlign,
      this.textsize,
      this.textFontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: textsize,
        fontWeight: textFontWeight,
        // textfontweight == 'bold' ? FontWeight.bold : FontWeight.normal,
        color: textcolor,
      ),
    );
  }
}
