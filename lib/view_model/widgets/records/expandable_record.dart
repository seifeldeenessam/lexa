import 'package:lexa/view_model/functions/show_modal.dart';
import 'package:lexa/view_model/models/transactions/transactions_create_screen_view_model.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExpandableRecord extends StatefulWidget {
  final int id;
  final String image;
  final String title;
  final String price;
  final String date;
  final String category;
  final String? note;
  final String billingAccount;
  final String currentBalance;

  const ExpandableRecord({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.date,
    required this.category,
    required this.note,
    required this.billingAccount,
    required this.currentBalance,
  }) : super(key: key);

  @override
  State<ExpandableRecord> createState() => _ExpandableRecordState();
}

class _ExpandableRecordState extends State<ExpandableRecord> {
  bool _visibility = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () => showModal(context, widget.title, ModalBody(id: widget.id)),
          // This Container is only to make the GestureDetector work properly
          child: Container(
            color: colorOnBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/categories/${widget.image.toLowerCase()}.png', width: 48, height: 48),
                const SizedBox(width: mainUnit / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
                      Text('${widget.price} E£', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorTertiary)),
                    ],
                  ),
                ),
                const SizedBox(width: mainUnit / 2),
                Transform.scale(
                  filterQuality: FilterQuality.high,
                  scaleY: _visibility ? -1 : 1,
                  child: ButtonWidget(
                    action: () => setState(() => _visibility = !_visibility),
                    icon: PhosphorIcons.caretDownBold,
                    type: ButtonTypes.secondary,
                    iconColor: colorTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: _visibility,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: mainUnit / 2),
              Detail(title: "Transaction Category", description: widget.category),
              const SizedBox(height: mainUnit / 4),
              widget.note == null ? const SizedBox() : Detail(title: "Note", description: widget.note.toString()),
              SizedBox(height: widget.note == null ? 0 : mainUnit / 4),
              Detail(title: "Billing Account", description: widget.billingAccount),
              const SizedBox(height: mainUnit / 4),
              Detail(title: "Current Balance Then", description: "${widget.currentBalance} E£"),
              const SizedBox(height: mainUnit / 4),
            ],
          ),
        ),
        const SizedBox(height: mainUnit / 2),
      ],
    );
  }
}

class Detail extends StatelessWidget {
  final String title;
  final String description;

  const Detail({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        Text(description, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
      ],
    );
  }
}

class ModalBody extends StatelessWidget {
  final int id;

  const ModalBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ButtonWidget(action: () {}, label: "Edit"),
        const SizedBox(height: mainUnit / 2),
        ButtonWidget(action: () => TransactionsCreateScreenViewModel().delete(id, context), label: "Delete", backgroundColor: colorRed),
      ],
    );
  }
}
