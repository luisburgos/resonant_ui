import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resonant_ui.dart';

class DashboardIconData extends NavigationIconData {
  DashboardIconData() : super(iconData: FontAwesomeIcons.thLarge);
}

class BackNavigationIconData extends NavigationIconData {
  BackNavigationIconData() : super(iconData: FontAwesomeIcons.arrowLeft);
}

class CloseNavigationIconData extends NavigationIconData {
  CloseNavigationIconData() : super(iconData: FontAwesomeIcons.arrowLeft);
}

class ProfileIconData extends NavigationIconData {
  ProfileIconData() : super(iconData: FontAwesomeIcons.solidUser);
}

class SettingsIconData extends NavigationIconData {
  SettingsIconData() : super(iconData: FontAwesomeIcons.cog);
}

class FavoriteIconData extends NavigationIconData {
  FavoriteIconData() : super(iconData: FontAwesomeIcons.heart);
}

class DrawerIconData extends NavigationIconData {
  DrawerIconData() : super(iconData: FontAwesomeIcons.bars);
}

class HomeIconData extends NavigationIconData {
  HomeIconData() : super(iconData: FontAwesomeIcons.home);
}

class DarkModeIconData extends NavigationIconData {
  DarkModeIconData() : super(iconData: FontAwesomeIcons.solidMoon);
}

class SearchIconData extends NavigationIconData {
  SearchIconData() : super(iconData: FontAwesomeIcons.search);
}

class CollapseIconData extends NavigationIconData {
  CollapseIconData() : super(iconData: FontAwesomeIcons.chevronLeft);
}

class AddIconData extends NavigationIconData {
  AddIconData() : super(iconData: FontAwesomeIcons.plus);
}
