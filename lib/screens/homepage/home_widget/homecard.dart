import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final Color? cardColor;
  final double? cardElevation;
  final ShapeBorder? cardShape;
  final Widget? cardChild;

  const HomeCard(
      {Key? key,
      this.cardColor,
      this.cardElevation,
      this.cardShape,
      this.cardChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: cardElevation,
      shape: cardShape,
      child: cardChild,
    );
  }
}
