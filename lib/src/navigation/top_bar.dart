import 'package:flutter/material.dart';

import 'constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    this.left,
    this.right,
    this.boxBorder,
    this.displaysBorder = true,
  }) : super(key: key);

  final List<Widget>? left;
  final List<Widget>? right;
  final BoxBorder? boxBorder;
  final bool displaysBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kDashboardTopHeight,
      padding: const EdgeInsets.all(kDashboardPadding),
      decoration: BoxDecoration(
        border: displaysBorder
            ? (boxBorder ??
                Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (left != null) ...left!,
          const Spacer(),
          if (right != null) ...right!,
        ],
      ),
    );
  }
}
