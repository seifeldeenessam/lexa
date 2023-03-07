import 'package:lexa/view/authentication/widgets/guiding_paragraph.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/models/authentication/phone_verification_screen_view_model.dart';
import 'package:lexa/view_model/widgets/number_pad.dart';
import 'package:lexa/view_model/widgets/inputs/pincode.dart';
import 'package:flutter/material.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _numbers = ["", "", "", ""];

  void _update(String value) {
    if (_numbers.elementAt(0) == "") {
      setState(() => _numbers[0] = value);
    } else if (_numbers.elementAt(1) == "") {
      setState(() => _numbers[1] = value);
    } else if (_numbers.elementAt(2) == "") {
      setState(() => _numbers[2] = value);
    } else if (_numbers.elementAt(3) == "") {
      setState(() => _numbers[3] = value);
      PhoneVerificationScreenViewModel().submit(context, _formKey, _numbers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: PhoneVerificationScreenViewModel().title)),
      body: Padding(
        padding: const EdgeInsets.all(mainUnit),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuidingParagragh(subTitle: PhoneVerificationScreenViewModel().subTitle, paragraph: PhoneVerificationScreenViewModel().paragraph),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  PINCodeInputWidget(numbers: _numbers),
                  const SizedBox(height: mainUnit),
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
