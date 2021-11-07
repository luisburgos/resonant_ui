import 'package:flutter/material.dart';

class ResonantHeader extends StatelessWidget {
  const ResonantHeader(
    this.title,
    this.trailing, {
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
