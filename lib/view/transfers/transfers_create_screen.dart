import 'package:flutter/material.dart';
import 'package:lexa/view_model/models/transfers/transfers_create_screen_view_model.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:lexa/view_model/widgets/inputs/text.dart';
import 'package:lexa/view_model/widgets/inputs/transfer.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransfersCreateScreen extends StatefulWidget {
  const TransfersCreateScreen({super.key});

  @override
  State<TransfersCreateScreen> createState() => _TransfersCreateScreenState();
}

class _TransfersCreateScreenState extends State<TransfersCreateScreen> {
  final Map<String, dynamic> _transactionData = {
    "sender": null,
    "reciever": null,
    "value": null,
  };

  void _senderChange(value) => setState(() => _transactionData["sender"] = value);
  void _recieverChange(value) => setState(() => _transactionData["reciever"] = value);
  void _valueChange(value) => setState(() => _transactionData["value"] = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          title: TransfersCreateScreenViewModel().title,
          actions: [
            ButtonWidget(action: () => Navigator.pushNamed(context, '/transaction/create'), icon: PhosphorIcons.regular.money, backgroundColor: Colors.transparent, type: ButtonTypes.primary),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: FutureBuilder(
          future: TransfersCreateScreenViewModel().getAccounts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TransferInputWidget(senderItems: snapshot.data, senderChange: _senderChange, recieverItems: snapshot.data, recieverChange: _recieverChange),
                  SizedBox(height: Units().spacing / 2),
                  TextInputWidget(label: "Amount *", onChange: _valueChange, keyboardType: "number"),
                  const Expanded(child: SizedBox()),
                  SizedBox(height: Units().spacing),
                  ButtonWidget(action: () => TransfersCreateScreenViewModel().submit(), label: "Transfer"),
                ],
              );
            } else {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(Units().spacing / 2),
                    decoration: BoxDecoration(color: GlobalColors().error, borderRadius: BorderRadius.circular(Units().spacing / 2)),
                    child: Text("Error rendering inputs", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
