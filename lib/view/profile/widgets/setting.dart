import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final IconData icon;
  final String title;

  const Setting({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
      margin: const EdgeInsets.only(bottom: mainUnit / 2),
      decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(borderRadius)),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: colorTertiary, size: 24),
          const SizedBox(width: mainUnit / 2),
          Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorTertiary)),
        ],
      ),
    );
  }
}
