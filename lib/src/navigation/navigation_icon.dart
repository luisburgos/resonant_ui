import 'package:flutter/material.dart';

import '../../resonant_ui.dart';

typedef NavigationIconBuilder = Widget Function(
  IconData, {
  int size,
  Color color,
});

typedef OnTapNavigationIcon = Function(int?);

class NavigationIconData {
  /// Required
  final IconData iconData;

  /// Optionals
  final NavigationIconBuilder? iconBuilder;
  final int? order;
  final String? label;
  final OnTapNavigationIcon? onTap;
  final BorderRadius? borderRadius;

  /// Defaults
  final bool isLabelDisplayed;
  final bool isSelected;
  final bool isRounded;
  final Color iconColor;
  final Color color;

  NavigationIconData({
    required this.iconData,
    this.iconBuilder,
    this.order,
    this.label,
    this.onTap,
    this.borderRadius,
    this.isLabelDisplayed = false,
    this.isSelected = false,
    this.isRounded = true,
    this.iconColor = Colors.black,
    this.color = Colors.white,
  });

  NavigationIconData copyWith({
    IconData? iconData,
    NavigationIconBuilder? iconBuilder,
    int? order,
    String? label,
    OnTapNavigationIcon? onTap,
    BorderRadius? borderRadius,
    bool? isLabelDisplayed,
    bool? isSelected,
    bool? isRounded,
    Color? iconColor,
    Color? color,
  }) =>
      NavigationIconData(
        iconData: iconData ?? this.iconData,
        iconBuilder: iconBuilder ?? this.iconBuilder,
        order: order ?? this.order,
        label: label ?? this.label,
        onTap: onTap ?? this.onTap,
        borderRadius: borderRadius ?? this.borderRadius,
        isLabelDisplayed: isLabelDisplayed ?? this.isLabelDisplayed,
        isSelected: isSelected ?? this.isSelected,
        isRounded: isRounded ?? this.isRounded,
        iconColor: iconColor ?? this.iconColor,
        color: color ?? this.color,
      );

  NavigationIconView asIconView() => NavigationIconView(data: this);
}

class NavigationIconView extends StatelessWidget {
  NavigationIconView({
    required this.data,
  });

  final NavigationIconData data;

  @override
  Widget build(BuildContext context) {
    final icon = data.iconBuilder != null
        ? data.iconBuilder!(
            data.iconData,
            size: 20,
            color: data.isSelected ? data.color : data.iconColor,
          )
        : Icon(
            data.iconData,
            size: 20,
            color: data.isSelected ? data.color : data.iconColor,
          );

    return RoundedSquareIcon(
      model: IconModel(
        icon: icon,
        color: data.isSelected ? data.iconColor : data.color,
        isRounded: data.isRounded,
        borderRadius: data.borderRadius,
        label: (data.label != null && data.isLabelDisplayed)
            ? SizedBox(
                width: 200,
                child: ResonantLabel(data.label!),
              )
            : null,
        onTap: data.onTap != null
            ? () {
                data.onTap!(data.order);
              }
            : null,
      ),
    );
  }
}
