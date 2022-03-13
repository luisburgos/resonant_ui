import 'package:flutter/material.dart';
import 'package:mr_skeleton/mr_skeleton.dart';

import '../../resonant_ui.dart';
import 'constants.dart';

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

    final settingsWidget = model.settings
        .copyWith(
          isLabelDisplayed: false,
          onTap: onItemTapped,
          isSelected: isDesktop && selectedIndex == model.settings.order,
        )
        .asIconView();

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
          model.home
              .copyWith(
                onTap: onItemTapped,
                isSelected: selectedIndex == model.home.order,
              )
              .asIconView(),
          const SizedBox(height: 16),
          model.secondary
              .copyWith(
                onTap: onItemTapped,
                isSelected: selectedIndex == model.secondary.order,
              )
              .asIconView(),
          const SizedBox(height: 16),
          model.extra
              .copyWith(
                onTap: onItemTapped,
                isSelected: selectedIndex == model.extra.order,
              )
              .asIconView(),
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
            model.darkMode!
                .copyWith(
                  isSelected: darkModeSettings!.isDarkMode,
                  onTap: (index) {
                    if (darkModeSettings!.onDarkModeTap == null) return;
                    darkModeSettings!.onDarkModeTap!();
                  },
                )
                .asIconView(),
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
                child: model.drawerIcon.copyWith(
                  onTap: (index) {
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    } else {
                      Scaffold.of(context).openDrawer();
                    }
                  },
                ).asIconView(),
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
                    model.home
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.home.order,
                        )
                        .asIconView(),
                    model.secondary
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.secondary.order,
                        )
                        .asIconView(),
                    model.addIconWidget,
                    model.extra
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.extra.order,
                        )
                        .asIconView(),
                    model.profile
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.profile.order,
                        )
                        .asIconView(),
                  ],
                )
              : null,
          drawer: isDrawer
              ? CustomDrawer(
                  selectedIndex: selectedIndex,
                  onItemTapped: onItemTapped,
                  items: [
                    model.home
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.home.order,
                        )
                        .asIconView(),
                    model.secondary
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.secondary.order,
                        )
                        .asIconView(),
                    model.extra
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.extra.order,
                        )
                        .asIconView(),
                    model.profile
                        .copyWith(
                          onTap: onItemTapped,
                          isSelected: selectedIndex == model.profile.order,
                        )
                        .asIconView(),
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
