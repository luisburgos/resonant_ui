import 'package:flutter/material.dart';

import 'constants.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({
    Key? key,
    required this.navigationItems,
    required this.selectedIndex,
    this.extraItems,
    this.expandIcon,
    this.isExpanded = false,
  }) : super(key: key);

  final int selectedIndex;
  final bool isExpanded;
  final List<Widget> navigationItems;
  final List<Widget>? extraItems;
  final Widget? expandIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isExpanded ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (expandIcon != null)
            _TopBarHeader(
              isExpanded: isExpanded,
              child: expandIcon!,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(kDashboardPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...navigationItems,
                  const Spacer(),
                  if (extraItems != null) ...extraItems!,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TopBarHeader extends StatelessWidget {
  const _TopBarHeader({
    Key? key,
    this.isExpanded = false,
    required this.child,
  }) : super(key: key);

  final bool isExpanded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kDashboardTopHeight,
      padding: const EdgeInsets.all(kDashboardPadding),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          if (isExpanded) const Spacer(),
        ],
      ),
    );
  }
}
