import 'package:flutter/material.dart';

class IconModel {
  final Function()? onTap;
  final IconData? iconData;
  final EdgeInsets? padding;
  final Color color;
  final Color iconColor;
  final Widget? icon;
  final double iconSize;
  final double iconBoxSize;
  final BorderRadius? borderRadius;
  final Widget? label;
  final bool isRounded;

  IconModel({
    this.onTap,
    this.iconData,
    this.padding,
    this.color = Colors.transparent,
    this.iconColor = Colors.black,
    this.icon,
    this.iconSize = 20,
    this.borderRadius,
    this.iconBoxSize = 40,
    this.label,
    this.isRounded = true,
  });
}

class RoundedSquareIcon extends StatelessWidget {
  final IconModel model;

  const RoundedSquareIcon({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = model.icon ??
        Icon(
          model.iconData,
          size: model.iconSize,
          color: model.iconColor,
        );

    final sizedBoxIcon = SizedBox(
      width: model.iconBoxSize,
      height: model.iconBoxSize,
      child: Center(
        child: icon,
      ),
    );

    final child = model.label == null
        ? InkWell(
            splashColor: Colors.blueGrey.shade100,
            hoverColor: Colors.grey.shade300,
            onTap: model.onTap,
            child: sizedBoxIcon,
          )
        : SizedBox(
            height: model.iconBoxSize,
            child: TextButton.icon(
              onPressed: model.onTap,
              icon: sizedBoxIcon,
              label: model.label!,
              style: TextButton.styleFrom(
                //TODO: Improve isRounded usage
                shape: BeveledRectangleBorder(
                  borderRadius: model.isRounded
                      ? (model.borderRadius ?? BorderRadius.circular(4.0))
                      : BorderRadius.zero,
                ),
              ),
            ),
          );

    //TODO: Improve isRounded usage
    if (model.isRounded) {
      return Container(
        padding: model.padding ?? EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: model.borderRadius ?? BorderRadius.circular(8.0),
          child: Material(
            color: model.color,
            child: child,
          ),
        ),
      );
    }

    return Container(
      padding: model.padding ?? EdgeInsets.zero,
      child: Material(
        color: model.color,
        child: child,
      ),
    );
  }
}
