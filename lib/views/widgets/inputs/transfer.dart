import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/views/widgets/inputs/dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransferInputWidget extends StatelessWidget {
  final List<dynamic>? senderItems;
  final Function(dynamic) senderChange;
  final List<dynamic>? recieverItems;
  final Function(dynamic) recieverChange;

  const TransferInputWidget({
    super.key,
    required this.senderItems,
    required this.senderChange,
    required this.recieverItems,
    required this.recieverChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: DropdownInputWidget(label: "Sender", items: senderItems, onChange: senderChange)),
        SizedBox(width: Units().spacing / 2),
        Icon(PhosphorIcons.light.swap, color: Theme.of(context).colorScheme.primary, size: 24),
        SizedBox(width: Units().spacing / 2),
        Expanded(child: DropdownInputWidget(label: "Reciver", items: recieverItems, onChange: recieverChange)),
      ],
    );
  }
}
