import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final Function(dynamic) onChange;
  final String? keyboardType;
  final bool? paragraph;
  final Widget? suffix;

  const TextInputWidget({
    super.key,
    required this.label,
    required this.onChange,
    this.keyboardType,
    this.paragraph,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: paragraph == true ? 5 : null,
      maxLines: paragraph == true ? 5 : 1,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      onChanged: (value) => onChange(value),
      scrollPhysics: const BouncingScrollPhysics(),
      cursorColor: colorPrimary,
      keyboardType: keyboardType == "number" ? TextInputType.number : TextInputType.text,
      style: Theme.of(context).textTheme.labelSmall,
      decoration: InputDecoration(hintText: label, suffix: suffix),
    );
  }
}
