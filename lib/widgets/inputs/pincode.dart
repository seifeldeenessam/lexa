import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PINCodeInputWidget extends StatelessWidget {
  final List<String> numbers;
  final Function(String) add;
  final Function() remove;
  final bool? secured;

  const PINCodeInputWidget({
    super.key,
    required this.numbers,
    required this.add,
    required this.remove,
    this.secured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PINCodeField(numbers: numbers, secured: secured),
        SizedBox(height: Units().spacing),
        NumberPad(numbers: numbers, add: add, remove: remove),
      ],
    );
  }
}

class PINCodeField extends StatelessWidget {
  final bool? secured;
  final List<String> numbers;

  const PINCodeField({super.key, required this.numbers, required this.secured});

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

class NumberPad extends StatelessWidget {
  final List<String> numbers;
  final Function(String) add;
  final Function() remove;

  const NumberPad({Key? key, required this.numbers, required this.add, required this.remove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [
      ButtonWidget(action: () => add("1"), label: "1").numberPadButton(context),
      ButtonWidget(action: () => add("2"), label: "2").numberPadButton(context),
      ButtonWidget(action: () => add("3"), label: "3").numberPadButton(context),
      ButtonWidget(action: () => add("4"), label: "4").numberPadButton(context),
      ButtonWidget(action: () => add("5"), label: "5").numberPadButton(context),
      ButtonWidget(action: () => add("6"), label: "6").numberPadButton(context),
      ButtonWidget(action: () => add("7"), label: "7").numberPadButton(context),
      ButtonWidget(action: () => add("8"), label: "8").numberPadButton(context),
      ButtonWidget(action: () => add("9"), label: "9").numberPadButton(context),
      const SizedBox(),
      ButtonWidget(action: () => add("0"), label: "0").numberPadButton(context),
      numbers[0] != "" ? ButtonWidget(action: () => remove(), icon: PhosphorIcons.bold.backspace, type: ButtonTypes.secondary) : const SizedBox(),
    ];

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: Units().spacing / 2,
      mainAxisSpacing: Units().spacing / 2,
      childAspectRatio: 2 / 0.9,
      children: buttons.map((button) => button).toList(),
    );
  }
}
