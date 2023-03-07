import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/functions/show_modal.dart';

class DropdownInputWidget extends StatefulWidget {
  final String label;
  final List<dynamic>? items;
  final Function(dynamic) onChange;
  final bool required;
  final bool isDense;

  const DropdownInputWidget({
    super.key,
    required this.label,
    required this.items,
    required this.onChange,
    this.required = true,
    this.isDense = false,
  });

  @override
  State<DropdownInputWidget> createState() => _DropdownInputWidgetState();
}

class _DropdownInputWidgetState extends State<DropdownInputWidget> {
  late String _selectedValue;

  void _setSelectedValue(String value) {
    widget.onChange(value);
    setState(() => _selectedValue = value);
    Navigator.pop(context);
  }

  @override
  void initState() {
    _selectedValue = widget.required ? widget.items![0].toString() : widget.label;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModal(context, widget.label, ModalBody(items: widget.items, onClick: _setSelectedValue)),
      child: Container(
        padding: widget.isDense ? const EdgeInsets.symmetric(vertical: mainUnit / 2) : const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
        decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(widget.isDense ? 0 : borderRadius)),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_selectedValue, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: _selectedValue != widget.label ? colorPrimary : colorTertiary)),
            const SizedBox(width: mainUnit / 2),
            const Icon(PhosphorIcons.caretDown, color: colorTertiary, size: 16),
          ],
        ),
      ),
    );
  }
}

class ModalBody extends StatelessWidget {
  final List<dynamic>? items;
  final Function(String) onClick;

  const ModalBody({super.key, required this.items, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: items!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onClick(items![index].toString()),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), color: colorOnBackground),
            child: Text(items![index].toString(), style: Theme.of(context).textTheme.labelSmall),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: mainUnit / 2),
    );
  }
}
