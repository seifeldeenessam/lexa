import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PasswordInputWidget extends StatefulWidget {
  final String placeholder;
  final Function(dynamic) onChange;
  final Function(String?) validator;

  const PasswordInputWidget({
    super.key,
    required this.placeholder,
    required this.onChange,
    required this.validator,
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
      cursorColor: colorPrimary,
      enableSuggestions: false,
      keyboardType: TextInputType.text,
      onChanged: (value) => widget.onChange(value),
      obscureText: hidden,
      obscuringCharacter: "•",
      maxLines: 1,
      scrollPadding: const EdgeInsets.all(mainUnit / 2),
      scrollPhysics: const BouncingScrollPhysics(),
      style: Theme.of(context).textTheme.labelMedium,
      textInputAction: TextInputAction.next,
      validator: (value) => widget.validator(value),
      decoration: InputDecoration(
        hintMaxLines: 1,
        hintText: widget.placeholder,
        errorText: null,
        suffixIcon: IconButton(
          onPressed: () => setState(() => hidden = !hidden),
          icon: Icon(hidden ? PhosphorIcons.eye : PhosphorIcons.eyeSlash, color: colorTertiary, size: 16),
        ),
      ),
    );
  }
}