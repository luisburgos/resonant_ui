import 'package:flutter/material.dart';

import 'constants.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(int?) onItemTapped;
  final int? selectedIndex;
  final List<Widget> items;

  const CustomBottomBar({
    Key? key,
    this.selectedIndex = 0,
    required this.items,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = items
        .map(
          (item) => Flexible(
            child: item,
          ),
        )
        .toList();

    return BottomAppBar(
      notchMargin: defaultNotchMargin,
      elevation: defaultBarElevation,
      child: SizedBox(
        height: defaultNavBarHeight,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function(int?) onItemTapped;
  final int? selectedIndex;
  final List<Widget> items;

  const CustomDrawer({
    Key? key,
    this.selectedIndex = 0,
    required this.items,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = items
        .map(
          (item) => Padding(
            padding: const EdgeInsets.all(8),
            child: item,
          ),
        )
        .toList();

    return Container(
      height: double.infinity,
      color: Colors.grey,
      child: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
