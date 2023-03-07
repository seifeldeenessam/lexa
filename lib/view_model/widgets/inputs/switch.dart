import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
        decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: _enabled == 1 ? colorPrimary : colorTertiary)),
            Container(
              alignment: _enabled == 1 ? Alignment.centerRight : Alignment.centerLeft,
              width: (mainUnit / 2) * 3,
              padding: const EdgeInsets.all(mainUnit / 6),
              decoration: BoxDecoration(color: _enabled == 1 ? colorPrimary : colorTertiary, borderRadius: BorderRadius.circular(mainUnit)),
              child: Container(
                width: mainUnit / 2,
                height: mainUnit / 2,
                decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(mainUnit / 4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
