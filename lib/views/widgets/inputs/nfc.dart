import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFCInputWidget extends StatelessWidget {
  final Function() onChange;
  final String label;

  const NFCInputWidget({super.key, required this.onChange, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(PhosphorIcons.light.scan, color: Theme.of(context).colorScheme.tertiary, size: 24),
            SizedBox(width: Units().spacing / 2),
            Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
          ],
        ),
      ),
    );
  }
}
