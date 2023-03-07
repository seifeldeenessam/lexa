import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:flutter/material.dart';

class NumberPadWidget extends StatelessWidget {
  final List<String> numbers;
  final Function(String) update;

  const NumberPadWidget({Key? key, required this.numbers, required this.update}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.005),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(action: () => update("1"), label: "1"),
                const SizedBox(height: mainUnit / 2),
                ButtonWidget(action: () => update("4"), label: "4"),
                const SizedBox(height: mainUnit / 2),
                ButtonWidget(action: () => update("7"), label: "7"),
              ],
            ),
          ),
          const SizedBox(width: mainUnit / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(action: () => update("2"), label: "2"),
                const SizedBox(height: mainUnit / 2),
                ButtonWidget(action: () => update("5"), label: "5"),
                const SizedBox(height: mainUnit / 2),
                ButtonWidget(action: () => update("8"), label: "8"),
                const SizedBox(height: mainUnit / 2),
                ButtonWidget(action: () => update("0"), label: "0"),
              ],
            ),
          ),
          const SizedBox(width: mainUnit / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(action: () => update("3"), label: "3"),
                const SizedBox(height: mainUnit / 2),
                ButtonWidget(action: () => update("6"), label: "6"),
                const SizedBox(height: mainUnit / 2),
                ButtonWidget(action: () => update("9"), label: "9"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
