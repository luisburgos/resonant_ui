import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double strokeWidth;
  final Color mainColor;

  const Loader({
    Key? key,
    this.strokeWidth = 4.0,
    this.mainColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
      ),
    );
  }

  static Widget small({Color mainColor = Colors.green}) => SizedBox(
        width: 40,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Loader(
            strokeWidth: 2,
            mainColor: mainColor,
          ),
        ),
      );

  static Widget extraSmall({Color mainColor = Colors.green}) => SizedBox(
        width: 20,
        height: 20,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Loader(
            strokeWidth: 2,
            mainColor: mainColor,
          ),
        ),
      );
}
