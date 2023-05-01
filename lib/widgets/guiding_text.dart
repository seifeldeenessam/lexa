import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';

class GuidingText extends StatelessWidget {
  final String subTitle;
  final String paragraph;

  const GuidingText({Key? key, required this.subTitle, required this.paragraph}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subTitle, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: Units().spacing / 2),
        Text(paragraph, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: GlobalColors().grey)),
      ],
    );
  }
}
