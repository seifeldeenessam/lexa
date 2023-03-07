import 'package:lexa/view_model/theme/constants.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
        decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(PhosphorIcons.scan, color: colorTertiary, size: 24),
            const SizedBox(width: mainUnit / 2),
            Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: colorTertiary)),
          ],
        ),
      ),
    );
  }
}
