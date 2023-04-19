import 'package:flutter/material.dart';
import 'package:lexa/theme/constants.dart';

class InfoRecordWidget extends StatelessWidget {
  final String title;
  final dynamic value;

  const InfoRecordWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(Units().spacing / 2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(Units().borderRadius),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(child: Text(title, style: Theme.of(context).textTheme.titleMedium)),
            SizedBox(height: Units().spacing / 6),
            Text("${value.toString()} E£", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
          ],
        ),
      ),
    );
  }
}
