import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/constants.dart';

class SwitchInputWidget extends StatefulWidget {
  final String label;
  final dynamic isEnabled;
  final Function(int) onSwitch;

  const SwitchInputWidget({super.key, required this.label, required this.isEnabled, required this.onSwitch});

  @override
  State<SwitchInputWidget> createState() => _SwitchInputWidgetState();
}

class _SwitchInputWidgetState extends State<SwitchInputWidget> {
  int _enabled = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _enabled == 0 ? _enabled = 1 : _enabled = 0);
        widget.onSwitch(_enabled);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: _enabled == 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary)),
            Container(
              alignment: _enabled == 1 ? Alignment.centerRight : Alignment.centerLeft,
              width: (Units().spacing / 2) * 3,
              padding: EdgeInsets.all(Units().spacing / 6),
              decoration: BoxDecoration(color: _enabled == 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary, borderRadius: BorderRadius.circular(Units().spacing)),
              child: Container(
                width: Units().spacing / 2,
                height: Units().spacing / 2,
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().spacing / 4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
