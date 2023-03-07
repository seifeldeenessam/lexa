import 'package:lexa/view/authentication/widgets/guiding_paragraph.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/functions/show_modal.dart';
import 'package:lexa/view_model/models/authentication/accounts_fill_screen_view_model.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:lexa/view_model/widgets/inputs/text.dart';
import 'package:flutter/material.dart';

class AccountsFillScreen extends StatefulWidget {
  const AccountsFillScreen({super.key});

  @override
  State<AccountsFillScreen> createState() => _AccountsFillScreenState();
}

class _AccountsFillScreenState extends State<AccountsFillScreen> {
  final Map<String, dynamic> _accountValues = {
    "cash": null,
    "banks": null,
    "savings": null,
    "cashCurrency": "EGP",
    "banksCurrency": "EGP",
    "savingsCurrency": "EGP",
  };

  void _cashChange(value) => setState(() => _accountValues["cash"] = num.parse(value));
  void _banksChange(value) => setState(() => _accountValues["banks"] = num.parse(value));
  void _savingsChange(value) => setState(() => _accountValues["savings"] = num.parse(value));
  void _cashCurrencyChange(value) => setState(() => _accountValues["cashCurrency"] = value);
  void _banksCurrencyChange(value) => setState(() => _accountValues["banksCurrency"] = value);
  void _savingsCurrencyChange(value) => setState(() => _accountValues["savingsCurrency"] = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AccountsFillScreenViewModel().title)),
      body: Padding(
        padding: const EdgeInsets.all(mainUnit),
        child: Column(
          children: [
            Expanded(child: GuidingParagragh(subTitle: AccountsFillScreenViewModel().subTitle, paragraph: AccountsFillScreenViewModel().paragraph)),
            FutureBuilder(
              future: AccountsFillScreenViewModel().getCurrenciesList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      TextInputWidget(
                        label: "Cash",
                        onChange: _cashChange,
                        keyboardType: "number",
                        suffix: GestureDetector(
                          onTap: () => showModal(context, "Choose currency", ModalBody(onChange: _cashCurrencyChange, currenciesList: snapshot.data)),
                          child: Text(_accountValues["cashCurrency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
                        ),
                      ),
                      const SizedBox(height: mainUnit / 2),
                      TextInputWidget(
                        label: "Banks",
                        onChange: _banksChange,
                        keyboardType: "number",
                        suffix: GestureDetector(
                          onTap: () => showModal(context, "Choose currency", ModalBody(onChange: _banksCurrencyChange, currenciesList: snapshot.data)),
                          child: Text(_accountValues["banksCurrency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
                        ),
                      ),
                      const SizedBox(height: mainUnit / 2),
                      TextInputWidget(
                        label: "Savings",
                        onChange: _savingsChange,
                        keyboardType: "number",
                        suffix: GestureDetector(
                          onTap: () => showModal(context, "Choose currency", ModalBody(onChange: _savingsCurrencyChange, currenciesList: snapshot.data)),
                          child: Text(_accountValues["savingsCurrency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
                        ),
                      ),
                      const SizedBox(height: mainUnit),
                      ButtonWidget(action: () => AccountsFillScreenViewModel().submit(context, _accountValues), label: "Continue"),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class ModalBody extends StatelessWidget {
  final List<Map>? currenciesList;
  final Function(String) onChange;

  const ModalBody({super.key, required this.currenciesList, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: currenciesList!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onChange(currenciesList![index]["code"]);
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(mainUnit / 2),
              decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(borderRadius)),
              child: Row(
                children: [
                  Expanded(child: Text(currenciesList![index]["name"], style: Theme.of(context).textTheme.bodyMedium)),
                  const SizedBox(width: mainUnit / 2),
                  Text(currenciesList![index]["code"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: mainUnit / 2),
      ),
    );
  }
}
