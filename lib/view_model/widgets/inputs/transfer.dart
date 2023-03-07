import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/inputs/dropdown.dart';
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
        const SizedBox(width: mainUnit / 2),
        const Icon(PhosphorIcons.swap, color: colorPrimary, size: 24),
        const SizedBox(width: mainUnit / 2),
        Expanded(child: DropdownInputWidget(label: "Reciver", items: recieverItems, onChange: recieverChange)),
      ],
    );
  }
}
