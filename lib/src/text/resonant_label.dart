import 'package:flutter/material.dart';

@Deprecated('Use ResonantText instead')
class ResonantLabel extends StatelessWidget {
  const ResonantLabel(
    this.title, {
    Key? key,
    this.fontSize = 12,
    this.letterSpacing = 2,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final double letterSpacing;

  ResonantLabel.s20(this.title)
      : fontSize = 20,
        letterSpacing = 2;
  ResonantLabel.s20ls0(this.title)
      : fontSize = 20,
        letterSpacing = 0;
  ResonantLabel.s14ls0(this.title)
      : fontSize = 14,
        letterSpacing = 0;
  ResonantLabel.ls0(this.title)
      : fontSize = 12,
        letterSpacing = 0;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
