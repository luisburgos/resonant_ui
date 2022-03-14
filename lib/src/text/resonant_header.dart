import 'package:flutter/material.dart';

class ResonantHeader extends StatelessWidget {
  const ResonantHeader(
    this.title, {
    Key? key,
    this.padding,
    this.trailing,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.only(
            bottom: 8,
            top: 8,
            left: 16,
            right: 16,
          ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.toUpperCase(),
              textAlign: textAlign,
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
