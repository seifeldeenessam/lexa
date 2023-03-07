import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

enum ButtonTypes {
  primary,
  secondary,
}

class ButtonWidget extends StatelessWidget {
  final VoidCallback action;
  final String? label;
  final Color? labelColor;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final ButtonTypes type;

  const ButtonWidget({
    super.key,
    required this.action,
    this.label,
    this.labelColor,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.type = ButtonTypes.primary,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets renderPadding() {
      if (type == ButtonTypes.secondary) {
        return const EdgeInsets.all(0);
      }

      return const EdgeInsets.symmetric(horizontal: mainUnit, vertical: mainUnit - 8);
    }

    Widget renderButtonContent() {
      if (label != null) {
        if (type == ButtonTypes.primary) {
          return Text(label!);
        } else {
          return Text(label!);
        }
      }

      if (icon != null) {
        if (type == ButtonTypes.primary) {
          return Icon(icon!, color: iconColor);
        } else {
          return Icon(icon!, color: iconColor);
        }
      }

      throw Exception('No content provided');
    }

    Color renderBackgroundColor() {
      if (type == ButtonTypes.secondary) {
        return Colors.transparent;
      }

      if (backgroundColor != null) {
        return backgroundColor!;
      }

      return colorOnBackground;
    }

    return TextButton(
      onPressed: action,
      style: TextButton.styleFrom(
        backgroundColor: renderBackgroundColor(),
        padding: renderPadding(),
        textStyle: Theme.of(context).textTheme.labelMedium,
      ),
      child: renderButtonContent(),
    );
  }
}
