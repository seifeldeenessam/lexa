import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final String name;
  final Function(String, dynamic, bool) onChange;
  final Function(String?)? validator;
  final String? keyboardType;
  final Widget? suffix;
  final bool? paragraph;
  final bool? parse;

  const TextInputWidget({
    super.key,
    required this.label,
    required this.name,
    required this.onChange,
    this.validator,
    this.keyboardType,
    this.paragraph,
    this.suffix,
    this.parse = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: paragraph == true ? 5 : null,
      maxLines: paragraph == true ? 5 : 1,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      onChanged: (value) => onChange(name, value, parse!),
      scrollPhysics: const BouncingScrollPhysics(),
      cursorColor: Theme.of(context).colorScheme.primary,
      validator: (value) => validator!(value),
      keyboardType: keyboardType == "number" ? TextInputType.number : TextInputType.text,
      style: Theme.of(context).textTheme.labelSmall,
      decoration: InputDecoration(
        hintMaxLines: 1,
        hintText: label,
        suffix: suffix,
      ),
    );
  }
}
