import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PasswordInputWidget extends StatefulWidget {
  final String placeholder;
  final String name;
  final Function(String, dynamic, bool) onChange;
  final Function(String?) validator;
  final bool? parse;

  const PasswordInputWidget({
    super.key,
    required this.placeholder,
    required this.name,
    required this.onChange,
    required this.validator,
    this.parse = false,
  });

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: false,
      cursorColor: Theme.of(context).colorScheme.primary,
      enableSuggestions: false,
      keyboardType: TextInputType.text,
      onChanged: (value) => widget.onChange(widget.name, value, widget.parse!),
      obscureText: hidden,
      obscuringCharacter: "•",
      maxLines: 1,
      scrollPadding: EdgeInsets.all(Units().spacing / 2),
      scrollPhysics: const BouncingScrollPhysics(),
      style: Theme.of(context).textTheme.labelMedium,
      textInputAction: TextInputAction.next,
      validator: (value) => widget.validator(value),
      decoration: InputDecoration(
        hintMaxLines: 1,
        hintText: widget.placeholder,
        errorText: null,
        suffixIcon: ButtonWidget(
          action: () => setState(() => hidden = !hidden),
          icon: hidden ? PhosphorIcons.light.eye : PhosphorIcons.light.eyeSlash,
          type: ButtonTypes.secondary,
        ),
      ),
    );
  }
}
