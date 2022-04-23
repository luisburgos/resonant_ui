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

  @Deprecated('TODO: Remove attribute')
  final String? title;

  /// TODO: Change to NavigationIconData class
  final Widget expandIcon;
  final Widget addIconWidget;

  final NavigationIconData drawerIcon;
  final NavigationIconData home;
  final NavigationIconData secondary;
  final NavigationIconData extra;
  final NavigationIconData profile;
  final NavigationIconData settings;
  final NavigationIconData collapseIcon;
  final NavigationIconData addIcon;
  final NavigationIconData? darkMode;
  final NavigationIconData? search;
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
