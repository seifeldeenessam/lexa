import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/functions/show_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DateInputWidget extends StatefulWidget {
  final Function(DateTime) onChange;
  final String label;

  const DateInputWidget({super.key, required this.onChange, required this.label});

  @override
  State<DateInputWidget> createState() => _DateInputWidgetState();
}

class _DateInputWidgetState extends State<DateInputWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pickDate(context).then((value) => widget.onChange(value!)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
        decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(PhosphorIcons.calendar, color: colorTertiary, size: 24),
            const SizedBox(width: mainUnit / 2),
            Text(widget.label, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
