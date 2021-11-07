import 'package:flutter/material.dart';

class ResonantLabel extends StatelessWidget {
  const ResonantLabel(
    this.title, {
    Key? key,
    this.fontSize = 12,
  }) : super(key: key);

  final String title;
  final double fontSize;

  ResonantLabel.s20(this.title) : fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }
}
