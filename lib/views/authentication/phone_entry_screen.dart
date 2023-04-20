import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/widgets/guiding_paragraph.dart';
import 'package:lexa/validators/phone_number_validator.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/button.dart';
import 'package:lexa/widgets/inputs/phone.dart';
import 'package:flutter/material.dart';

class PhoneEntryScreen extends StatefulWidget {
  const PhoneEntryScreen({super.key});

  @override
  State<PhoneEntryScreen> createState() => _PhoneEntryScreenState();
}

class _PhoneEntryScreenState extends State<PhoneEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _phone;

  void _phoneChange(String value) => setState(() => _phone = value);

  void _submit(BuildContext context, GlobalKey<FormState> formKey, String? phone) {
    if (formKey.currentState!.validate()) Navigator.pushNamed(context, '/phone-verification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().phoneEntryScreenTitle)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuidingParagragh(subTitle: AppTexts().phoneEntryScreenSubTitle, paragraph: AppTexts().phoneEntryScreenParagraph),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PhoneInputWidget(placeholder: "Phone number", onChange: _phoneChange, validator: phoneNumberValidator),
                  SizedBox(height: Units().spacing),
                  ButtonWidget(action: () => _submit(context, _formKey, _phone), label: "Continue"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
