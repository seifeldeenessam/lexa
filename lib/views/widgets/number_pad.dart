import 'package:lexa/utilities/constants.dart';
import 'package:lexa/views/widgets/button.dart';
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
                SizedBox(height: Units().spacing / 2),
                ButtonWidget(action: () => update("4"), label: "4"),
                SizedBox(height: Units().spacing / 2),
                ButtonWidget(action: () => update("7"), label: "7"),
              ],
            ),
          ),
          SizedBox(width: Units().spacing / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(action: () => update("2"), label: "2"),
                SizedBox(height: Units().spacing / 2),
                ButtonWidget(action: () => update("5"), label: "5"),
                SizedBox(height: Units().spacing / 2),
                ButtonWidget(action: () => update("8"), label: "8"),
                SizedBox(height: Units().spacing / 2),
                ButtonWidget(action: () => update("0"), label: "0"),
              ],
            ),
          ),
          SizedBox(width: Units().spacing / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(action: () => update("3"), label: "3"),
                SizedBox(height: Units().spacing / 2),
                ButtonWidget(action: () => update("6"), label: "6"),
                SizedBox(height: Units().spacing / 2),
                ButtonWidget(action: () => update("9"), label: "9"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
