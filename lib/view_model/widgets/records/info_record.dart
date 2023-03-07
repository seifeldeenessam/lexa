import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(mainUnit / 2),
        decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(child: Text(title, style: Theme.of(context).textTheme.titleMedium)),
            const SizedBox(height: mainUnit / 6),
            Text("${value.toString()} E£", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorTertiary)),
          ],
        ),
      ),
    );
  }
}
