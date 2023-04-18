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
        padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(PhosphorIcons.calendar, color: Theme.of(context).colorScheme.tertiary, size: 24),
            SizedBox(width: Units().spacing / 2),
            Text(widget.label, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
