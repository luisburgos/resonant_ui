import 'package:flutter/material.dart';
import 'package:mr_skeleton/mr_skeleton.dart';

import '../../resonant_ui.dart';
import 'constants.dart';
import 'custom_bottom_bar.dart';
import 'models.dart';
import 'side_navigation.dart';
import 'top_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    Key? key,
    required this.model,
    required this.body,
    required this.selectedIndex,
    required this.onItemTapped,
    this.isDesktop = false,
    this.onDesktopBreakpointChanged,
    this.darkModeSettings,
  }) : super(key: key);

  final Function(bool)? onDesktopBreakpointChanged;
  final Function(int?) onItemTapped;
  final int selectedIndex;
  final bool isDesktop;
  final Widget body;
  final DashboardModel model;
  final DarkModeSettings? darkModeSettings;

  bool get isDrawer => model.mode == DashboardMode.drawer;
  bool get isBottomBar => model.mode == DashboardMode.bottomBar;

  @override
  Widget build(BuildContext context) {
    final titleWidget = ResonantLabel.s20(model.title!);

    final settingsWidget = model.settings.asRoundedSquareIcon(
      displaysLabel: false,
      onTap: onItemTapped,
      isSelected: isDesktop && selectedIndex == model.settings.order,
    );

    return MRSkeleton(
      isLeftExpanded: false,
      isRightExpanded: false,
      expandedLeftWidth: 180,
      onDesktopBreakpointChanged: onDesktopBreakpointChanged,
      left: SideNavigation(
        expandIcon: model.expandIcon,
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
        navigationItems: [
          model.home.asRoundedSquareIcon(
            onTap: onItemTapped,
            isSelected: selectedIndex == model.home.order,
          ),
          const SizedBox(height: 16),
          model.secondary.asRoundedSquareIcon(
            onTap: onItemTapped,
            isSelected: selectedIndex == model.secondary.order,
          ),
          const SizedBox(height: 16),
          model.extra.asRoundedSquareIcon(
            onTap: onItemTapped,
            isSelected: selectedIndex == model.extra.order,
          ),
        ],
        extraItems: [
          model.addIconWidget,
          const SizedBox(height: 16),
          settingsWidget
        ],
      ),
      top: TopBar(
        left: [
          titleWidget,
        ],
        right: [
          if (model.darkMode != null &&
              darkModeSettings != null &&
              darkModeSettings!.isEnabled) ...[
            model.darkMode!.asRoundedSquareIcon(
              isSelected: darkModeSettings!.isDarkMode,
              onTap: (index) {
                if (darkModeSettings!.onDarkModeTap == null) return;
                darkModeSettings!.onDarkModeTap!();
              },
            ),
            const SizedBox(width: 16),
          ],
          /*_ProfilePopUpCardNavigationIcon(
            menuController: menuController,
            navigationIcon: model.profile,
          ),*/
          ///TODO: Extract. It depends on library. Parametrize menu items.
          /*PopupMenuButton(
            child: model.profile.asRoundedSquareIcon(),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: ResonantLabel.ls0('Enter code'),
                ),
                PopupMenuItem(
                  child: ResonantLabel.ls0('Refer a friend'),
                ),
              ];
            },
          ),*/
        ],
      ),
      body: body,
      mobileBuilder: (Widget child) {
        return Scaffold(
          body: child,
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            title: model.title != null ? titleWidget : null,
            leading: Builder(builder: (context) {
              return _TopIconContainer(
                child: model.drawerIcon.asRoundedSquareIcon(
                  onTap: (index) {
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    } else {
                      Scaffold.of(context).openDrawer();
                    }
                  },
                ),
              );
            }),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            actions: [
              _TopIconContainer(
                child: settingsWidget,
              ),
            ],
          ),
          bottomNavigationBar: isBottomBar
              ? CustomBottomBar(
                  selectedIndex: selectedIndex,
                  onItemTapped: onItemTapped,
                  items: [
                    model.home.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.home.order,
                    ),
                    model.secondary.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.secondary.order,
                    ),
                    model.addIconWidget,
                    model.extra.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.extra.order,
                    ),
                    model.profile.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.profile.order,
                    ),
                  ],
                )
              : null,
          drawer: isDrawer
              ? CustomDrawer(
                  selectedIndex: selectedIndex,
                  onItemTapped: onItemTapped,
                  items: [
                    model.home.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.home.order,
                    ),
                    model.secondary.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.secondary.order,
                    ),
                    model.extra.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.extra.order,
                    ),
                    model.profile.asRoundedSquareIcon(
                      onTap: onItemTapped,
                      isSelected: selectedIndex == model.profile.order,
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}

class _TopIconContainer extends StatelessWidget {
  const _TopIconContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kDashboardTopHeight,
      padding: const EdgeInsets.all(kDashboardPadding),
      child: child,
    );
  }
}
