import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Widget child;

  const RoundedCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white70,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
