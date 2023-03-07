import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

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
        color: colorOnBackground,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers.map((number) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
              child: Text(
                renderText(number),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: colorPrimary),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
