import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/views/widgets/inputs/dropdown.dart';

class SelectorWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final List list;

  const SelectorWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onChange(title) => {};

    return Container(
      padding: EdgeInsets.all(Units().spacing / 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Units().borderRadius), color: Theme.of(context).colorScheme.onBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "$title\n", style: Theme.of(context).textTheme.titleMedium),
                  TextSpan(text: subTitle, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                ],
              ),
            ),
          ),
          DropdownInputWidget(label: "Choose account", items: list, isDense: true, onChange: onChange),
        ],
      ),
    );
  }
}
