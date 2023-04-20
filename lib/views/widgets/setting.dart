import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final IconData icon;
  final String title;

  const Setting({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
      margin: EdgeInsets.only(bottom: Units().spacing / 2),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.tertiary, size: 24),
          SizedBox(width: Units().spacing / 2),
          Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ],
      ),
    );
  }
}
