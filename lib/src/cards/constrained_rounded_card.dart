import 'package:flutter/material.dart';

import '../text/resonant_header.dart';
import 'rounded_card.dart';

class ConstrainedRoundedCard extends StatelessWidget {
  const ConstrainedRoundedCard({
    Key? key,
    this.title,
    required this.children,
    this.maxWidth = 850,
    this.minWidth = 0.0,
    this.topSpace = 16,
    this.bottomSpace = 16,
    this.mainAxisSize = MainAxisSize.min,
    this.trailing,
  }) : super(key: key);

  final String? title;
  final Widget? trailing;
  final List<Widget> children;
  final double maxWidth;
  final double minWidth;
  final double topSpace;
  final double bottomSpace;
  final MainAxisSize mainAxisSize;

  bool get hasTitle => title != null;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        minWidth: minWidth,
      ),
      child: RoundedCard(
        child: Column(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topSpace),
            if (hasTitle) ...[
              ResonantHeader(title!, trailing),
              const Divider(),
            ],
            ...children,
            SizedBox(height: bottomSpace),
          ],
        ),
      ),
    );
  }
}
