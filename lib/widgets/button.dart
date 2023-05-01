import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ButtonTypes { primary, secondary }

class ButtonWidget extends StatelessWidget {
  final VoidCallback action;
  final String? label;
  final Color? labelColor;
  final PhosphorIconData? icon;
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
    Widget renderButtonContent() {
      if (label != null) return Text(label!, style: TextStyle(color: labelColor));
      return PhosphorIcon(icon!, color: iconColor);
    }

    Color decideBackgroundColor() {
      if (type == ButtonTypes.secondary) return Colors.transparent;
      if (backgroundColor != null) return backgroundColor!;
      return Theme.of(context).colorScheme.onBackground;
    }

    EdgeInsets decidePadding() {
      if (type == ButtonTypes.secondary) return const EdgeInsets.all(0);
      return EdgeInsets.symmetric(horizontal: Units().spacing, vertical: Units().spacing - 8);
    }

    VisualDensity decideVisualDensity() {
      if (type == ButtonTypes.secondary) return VisualDensity.compact;
      return VisualDensity.standard;
    }

    return TextButton(
      onPressed: action,
      style: TextButton.styleFrom(
        padding: decidePadding(),
        visualDensity: decideVisualDensity(),
        backgroundColor: decideBackgroundColor(),
        textStyle: Theme.of(context).textTheme.labelMedium,
      ),
      child: renderButtonContent(),
    );
  }
}

extension ButtonExtension on ButtonWidget {
  TextButton numberPadButton(BuildContext context) {
    Widget renderButtonContent() {
      if (label != null) return Text(label!, style: TextStyle(color: labelColor));
      return PhosphorIcon(icon!, color: iconColor);
    }

    return TextButton(
      onPressed: action,
      style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 32)),
      child: renderButtonContent(),
    );
  }
}
