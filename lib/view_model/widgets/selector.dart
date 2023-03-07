import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/widgets/inputs/dropdown.dart';

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
      padding: const EdgeInsets.all(mainUnit / 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), color: colorOnBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "$title\n", style: Theme.of(context).textTheme.titleMedium),
                  TextSpan(text: subTitle, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
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