import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

class GuidingParagragh extends StatelessWidget {
  final String subTitle;
  final String paragraph;

  const GuidingParagragh({Key? key, required this.subTitle, required this.paragraph}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subTitle, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: mainUnit / 2),
        Text(paragraph, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorTertiary)),
      ],
    );
  }
}
