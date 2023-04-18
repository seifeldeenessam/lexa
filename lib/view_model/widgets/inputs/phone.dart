import 'dart:convert';

import 'package:lexa/view_model/functions/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexa/view_model/theme/constants.dart';

class PhoneInputWidget extends StatefulWidget {
  final String placeholder;
  final Function(String) onChange;
  final Function(String, String?) validator;

  const PhoneInputWidget({
    super.key,
    required this.placeholder,
    required this.onChange,
    required this.validator,
  });

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  String _selectedCountryCode = "+20";

  void _selectedCountryCodeChange(value) => setState(() => _selectedCountryCode = value);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: false,
      cursorColor: Theme.of(context).colorScheme.primary,
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      onChanged: (value) => widget.onChange(_selectedCountryCode + value),
      maxLines: 1,
      scrollPadding: EdgeInsets.all(Units().spacing / 2),
      scrollPhysics: const BouncingScrollPhysics(),
      style: Theme.of(context).textTheme.labelMedium,
      textInputAction: TextInputAction.next,
      validator: (value) => widget.validator(_selectedCountryCode, value),
      decoration: InputDecoration(
        hintMaxLines: 1,
        hintText: widget.placeholder,
        errorText: null,
        prefixIcon: CountryCodeSelector(onChange: _selectedCountryCodeChange),
        prefixIconConstraints: const BoxConstraints.tightForFinite(),
      ),
    );
  }
}

class CountryCodeSelector extends StatefulWidget {
  final Function(String) onChange;

  const CountryCodeSelector({Key? key, required this.onChange}) : super(key: key);

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {
  Map<String, String> selectedCountry = {
    "code": "+20",
    "flag": "eg",
  };

  void _countryChange(value) {
    setState(() {
      selectedCountry["code"] = value["code"];
      selectedCountry["flag"] = value["flag"];
      widget.onChange(value["code"]);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModal(context, 'Choose your country', ModalBody(onChange: _countryChange)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: Units().spacing / 4,
          children: [
            Image.asset('assets/images/flags/${selectedCountry["flag"]}.png', width: 24, height: 16),
            Text(selectedCountry["code"].toString(), style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

class ModalBody extends StatefulWidget {
  final Function(Map<String, String>) onChange;

  const ModalBody({super.key, required this.onChange});

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  List _countries = [];

  Future<void> _getCountries() async {
    final String url = await rootBundle.loadString('assets/data/country_codes.json');
    final response = await jsonDecode(url);
    setState(() => _countries = response);
  }

  @override
  void initState() {
    super.initState();
    _getCountries();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: _countries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => widget.onChange({"code": _countries[index]["dial_code"], "flag": _countries[index]["code"].toString().toLowerCase()}),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
              child: Row(
                children: [
                  Image.asset('assets/images/flags/${_countries[index]["code"].toString().toLowerCase()}.png', width: 24, height: 16),
                  SizedBox(width: Units().spacing / 2),
                  Expanded(child: Text(_countries[index]["name"], style: Theme.of(context).textTheme.bodyMedium)),
                  SizedBox(width: Units().spacing / 2),
                  Text(_countries[index]["dial_code"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
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
