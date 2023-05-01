import 'dart:convert';

import 'package:lexa/utilities/format_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/utilities/show_modal.dart';

class PhoneInputWidget extends StatefulWidget {
  final String placeholder;
  final String name;
  final Function(String, dynamic, bool) onChange;
  final Function(String, String?) validator;
  final bool? parse;

  const PhoneInputWidget({
    super.key,
    required this.placeholder,
    required this.name,
    required this.onChange,
    required this.validator,
    this.parse = false,
  });

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  late String _selectedCountryCode;

  void _selectedCountryCodeChange(value) => setState(() => _selectedCountryCode = value);

  @override
  void initState() {
    super.initState();
    _selectedCountryCode = "+20";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: false,
      enableSuggestions: false,
      onChanged: (value) => widget.onChange(widget.name, "$_selectedCountryCode ${formatPhoneNumber(value)}}", widget.parse!),
      validator: (value) => widget.validator(_selectedCountryCode, value),
      scrollPadding: EdgeInsets.all(Units().spacing / 2),
      scrollPhysics: const BouncingScrollPhysics(),
      style: Theme.of(context).textTheme.labelMedium,
      textInputAction: TextInputAction.next,
      cursorColor: Theme.of(context).colorScheme.primary,
      keyboardType: TextInputType.number,
      maxLines: 1,
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
  Map<String, String> selectedCountry = {"code": "+20", "flag": "eg"};

  void _onChange(value) {
    setState(() {
      selectedCountry["code"] = value["code"];
      selectedCountry["flag"] = value["flag"];
      widget.onChange(value["code"]);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModal(context, 'Choose your country', ModalBody(onChange: _onChange)),
      child: Padding(
        padding: EdgeInsets.all(Units().spacing / 2),
        child: Image.asset('assets/images/flags/${selectedCountry["flag"]}.png', width: Units().spacing),
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
                  Image.asset('assets/images/flags/${_countries[index]["code"].toString().toLowerCase()}.png', width: Units().spacing),
                  SizedBox(width: Units().spacing / 2),
                  Expanded(child: Text(_countries[index]["name"], style: Theme.of(context).textTheme.bodyMedium)),
                  SizedBox(width: Units().spacing / 2),
                  Text(_countries[index]["dial_code"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: GlobalColors().grey)),
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
