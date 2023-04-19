import 'package:flutter/material.dart';
import 'package:lexa/theme/constants.dart';

class PINCodeInputWidget extends StatelessWidget {
  final List<String> numbers;
  final bool? secured;

  const PINCodeInputWidget({super.key, required this.numbers, this.secured});

  @override
  Widget build(BuildContext context) {
    String renderText(number) {
      String character = "−";

      if (secured == true) {
        if (number == "") {
          character = character;
        } else {
          character = "∗";
        }
      } else {
        if (number == "") {
          character = character;
        } else {
          character = number;
        }
      }

      return character;
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(Units().borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers.map((number) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
              child: Text(
                renderText(number),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
