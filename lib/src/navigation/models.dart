import 'package:flutter/material.dart';

import '../../resonant_ui.dart';

class DashboardModel {
  DashboardModel({
    this.title,
    required this.drawerIcon,
    required this.home,
    required this.secondary,
    required this.extra,
    required this.profile,
    required this.settings,
    required this.collapseIcon,
    required this.addIcon,
    required this.addIconWidget,
    required this.expandIcon,
    this.darkMode,
    this.search,
    this.mode = DashboardMode.drawer,
  });

  final String? title;
  final Widget expandIcon;
  final Widget addIconWidget;

  final NavigationIconModel drawerIcon;
  final NavigationIconModel home;
  final NavigationIconModel secondary;
  final NavigationIconModel extra;
  final NavigationIconModel profile;
  final NavigationIconModel settings;
  final NavigationIconModel collapseIcon;
  final NavigationIconModel addIcon;
  final NavigationIconModel? darkMode;
  final NavigationIconModel? search;
  final DashboardMode mode;
}

enum DashboardMode {
  drawer,
  bottomBar,
}

class DarkModeSettings {
  DarkModeSettings({
    this.onDarkModeTap,
    this.isDarkMode = false,
    this.isEnabled = false,
  });

  final Function()? onDarkModeTap;
  final bool isDarkMode;
  final bool isEnabled;
}

abstract class NavigationIconModel {
  int? order;
  IconData get iconData;
  String? get label;
  late Widget Function(IconData, {int size, Color color}) iconBuilder;

  RoundedSquareIcon asRoundedSquareIcon({
    bool displaysLabel = false,
    Color iconColor = Colors.black,
    Color color = Colors.white,
    Function(int?)? onTap,
    bool isSelected = false,
    bool isRounded = true,
    BorderRadius? borderRadius,
  }) {
    return RoundedSquareIcon(
      model: IconModel(
        icon: iconBuilder(
          iconData,
          size: 20,
          color: isSelected ? color : iconColor,
        ),
        color: isSelected ? iconColor : color,
        isRounded: isRounded,
        borderRadius: borderRadius,
        label: (label != null && displaysLabel)
            ? SizedBox(
                width: 200,
                child: ResonantLabel(label!),
              )
            : null,
        onTap: onTap == null
            ? null
            : () {
                onTap(order);
              },
      ),
    );
  }
}
