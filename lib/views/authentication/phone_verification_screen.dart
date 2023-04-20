import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/widgets/guiding_paragraph.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/number_pad.dart';
import 'package:lexa/widgets/inputs/pincode.dart';
import 'package:flutter/material.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _numbers = ["", "", "", ""];

  void _submit(BuildContext context, GlobalKey<FormState> formKey, List<String> numbers) {
    if (formKey.currentState!.validate()) Navigator.pushNamed(context, '/personal-info');
  }

  void _update(String value) {
    if (_numbers.elementAt(0) == "") {
      setState(() => _numbers[0] = value);
    } else if (_numbers.elementAt(1) == "") {
      setState(() => _numbers[1] = value);
    } else if (_numbers.elementAt(2) == "") {
      setState(() => _numbers[2] = value);
    } else if (_numbers.elementAt(3) == "") {
      setState(() => _numbers[3] = value);
      _submit(context, _formKey, _numbers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().phoneVerificationScreenTitle)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuidingParagragh(subTitle: AppTexts().phoneVerificationScreenSubTitle, paragraph: AppTexts().phoneVerificationScreenParagraph),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  PINCodeInputWidget(numbers: _numbers),
                  SizedBox(height: Units().spacing),
                  NumberPadWidget(numbers: _numbers, update: _update),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
