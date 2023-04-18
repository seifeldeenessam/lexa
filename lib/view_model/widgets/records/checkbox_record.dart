import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CheckboxRecordWidget extends StatefulWidget {
  final int? id;
  final String title;
  final double? price;
  final String? note;
  final String? link;
  final int isImportant;
  final int isChecked;

  const CheckboxRecordWidget({
    Key? key,
    this.id,
    required this.title,
    this.price,
    this.note,
    this.link,
    required this.isImportant,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<CheckboxRecordWidget> createState() => _CheckboxRecordWidgetState();
}

class _CheckboxRecordWidgetState extends State<CheckboxRecordWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.id.toString()),
      confirmDismiss: (direction) async {
        return await showModalBottomSheet<bool>(
          context: context,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Units().borderRadius),
              topRight: Radius.circular(Units().borderRadius),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                Container(
                  padding: EdgeInsets.all(Units().spacing),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Confirm to delete",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Units().spacing),
                        ButtonWidget(action: () => Navigator.of(context).pop(false), label: "cancel", backgroundColor: Theme.of(context).colorScheme.onBackground),
                        SizedBox(height: Units().spacing / 2),
                        ButtonWidget(action: () => Navigator.of(context).pop(true), label: "delete", labelColor: Theme.of(context).colorScheme.background, backgroundColor: GlobalColors().error),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      direction: DismissDirection.endToStart,
      movementDuration: const Duration(milliseconds: 300),
      resizeDuration: const Duration(milliseconds: 300),
      onDismissed: (DismissDirection direction) {},
      background: Container(
        padding: EdgeInsets.all(Units().spacing / 2),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: GlobalColors().error,
          borderRadius: BorderRadius.circular(Units().borderRadius),
        ),
        child: Icon(PhosphorIcons.trashFill, color: Theme.of(context).colorScheme.primary),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: widget.isImportant == 1 ? GlobalColors().error : Colors.transparent,
                borderRadius: BorderRadius.circular(Units().spacing),
              ),
            ),
            SizedBox(width: Units().spacing / 2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: Units().spacing / 6),
                  if (widget.note != null) Text(widget.note!, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                  if (widget.note != null) SizedBox(height: Units().spacing / 6),
                  if (widget.price != null) Text(widget.price!.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                  if (widget.price != null) SizedBox(height: Units().spacing / 6),
                  if (widget.link != null) Text(widget.link!, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                  if (widget.link != null) SizedBox(height: Units().spacing / 6),
                ],
              ),
            ),
            ButtonWidget(
              action: () {},
              icon: widget.isChecked == 1 ? PhosphorIcons.checkSquare : PhosphorIcons.square,
              iconColor: Theme.of(context).colorScheme.primary,
              type: ButtonTypes.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
