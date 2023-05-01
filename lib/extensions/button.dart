import 'package:flutter/material.dart';
import 'package:lexa/widgets/button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
