import 'package:lexa/view/authentication/widgets/guiding_paragraph.dart';
import 'package:lexa/view_model/validators/phone_number_validator.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/models/authentication/phone_entry_screen_view_model.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:lexa/view_model/widgets/inputs/phone.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: PhoneEntryScreenViewModel().title)),
      body: Padding(
        padding: const EdgeInsets.all(mainUnit),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuidingParagragh(subTitle: PhoneEntryScreenViewModel().subTitle, paragraph: PhoneEntryScreenViewModel().paragraph),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PhoneInputWidget(placeholder: "Phone number", onChange: _phoneChange, validator: phoneNumberValidator),
                  const SizedBox(height: mainUnit),
                  ButtonWidget(action: () => PhoneEntryScreenViewModel().submit(context, _formKey, _phone), label: "Continue"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
