import 'package:lexa/utilities/show_modal.dart';
import 'package:lexa/viewmodels/authentication.dart';
import 'package:lexa/widgets/guiding_text.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lexa/widgets/inputs/text.dart';

class AccountsFillScreen extends StatefulWidget {
  const AccountsFillScreen({super.key});

  @override
  State<AccountsFillScreen> createState() => AccountsFillScreenState();
}

class AccountsFillScreenState extends State<AccountsFillScreen> {
  final _formKey = GlobalKey<FormState>();
  late final Map<String, dynamic> _data;

  void _handleValueChange(String name, dynamic value, bool parse) {
    setState(() => _data[name]["value"] = parse ? num.parse(value) : value);
  }

  void _handleCurrencyChange(String name, dynamic value, bool parse) {
    setState(() => _data[name]["currency"] = parse ? num.parse(value) : value);
  }

  String? _cashAccountValidator(String? value) {
    if (value == null || value.isEmpty) return "Cash can't be empty";
    return null;
  }

  String? _banksAccountValidator(String? value) {
    if (value == null || value.isEmpty) return "Banks can't be empty";
    return null;
  }

  String? _savingsAccountValidator(String? value) {
    if (value == null || value.isEmpty) return "Savings can't be empty";
    return null;
  }

  @override
  void initState() {
    super.initState();
    _data = {
      "cash": {"value": 0.0, "currency": "EGP"},
      "banks": {"value": 0.0, "currency": "EGP"},
      "savings": {"value": 0.0, "currency": "EGP"},
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AccountsCreateViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          children: [
            Expanded(child: GuidingText(subTitle: AccountsCreateViewModel().subTitle, paragraph: AccountsCreateViewModel().paragraph)),
            FutureBuilder(
              future: AccountsCreateViewModel().getCurrenciesList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Form(
                    key: _formKey,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        TextInputWidget(
                          label: "Cash",
                          name: "cash",
                          onChange: _handleValueChange,
                          validator: _cashAccountValidator,
                          keyboardType: "number",
                          suffix: GestureDetector(
                            onTap: () => showModal(context, "Choose currency", ModalBody(name: "cash", onChange: _handleCurrencyChange, currencies: snapshot.data)),
                            child: Text(_data["cash"]["currency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: GlobalColors().grey)),
                          ),
                        ),
                        SizedBox(height: Units().spacing / 2),
                        TextInputWidget(
                          label: "Banks",
                          name: "banks",
                          onChange: _handleValueChange,
                          validator: _banksAccountValidator,
                          keyboardType: "number",
                          suffix: GestureDetector(
                            onTap: () => showModal(context, "Choose currency", ModalBody(name: "banks", onChange: _handleCurrencyChange, currencies: snapshot.data)),
                            child: Text(_data["banks"]["currency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: GlobalColors().grey)),
                          ),
                        ),
                        SizedBox(height: Units().spacing / 2),
                        TextInputWidget(
                          label: "Savings",
                          name: "savings",
                          onChange: _handleValueChange,
                          validator: _savingsAccountValidator,
                          keyboardType: "number",
                          suffix: GestureDetector(
                            onTap: () => showModal(context, "Choose currency", ModalBody(name: "savings", onChange: _handleCurrencyChange, currencies: snapshot.data)),
                            child: Text(_data["savings"]["currency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: GlobalColors().grey)),
                          ),
                        ),
                        SizedBox(height: Units().spacing),
                        ButtonWidget(action: () => AccountsCreateViewModel().submit(context, _formKey, _data), label: "Continue"),
                      ],
                    ),
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
  final List<Map>? currencies;
  final String name;
  final Function(String, dynamic, bool) onChange;
  final bool? parse;

  const ModalBody({super.key, required this.currencies, required this.name, required this.onChange, this.parse = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: currencies!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onChange(name, currencies![index]["code"], parse!);
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(Units().spacing / 2),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
              child: Row(
                children: [
                  Expanded(child: Text(currencies![index]["name"], style: Theme.of(context).textTheme.bodyMedium)),
                  SizedBox(width: Units().spacing / 2),
                  Text(currencies![index]["code"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: GlobalColors().grey)),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: Units().spacing / 2),
      ),
    );
  }
}
