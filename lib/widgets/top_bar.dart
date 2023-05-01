import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Hello Saif 👋🏼", style: Theme.of(context).textTheme.titleMedium),
              TextSpan(text: "\nNice to see you", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: GlobalColors().grey)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/settings"),
          child: PhosphorIcon(PhosphorIcons.thin.userCircle, color: Theme.of(context).colorScheme.primary, size: 32.0),
        ),
      ],
    );
  }
}
