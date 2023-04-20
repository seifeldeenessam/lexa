import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/utilities/show_snackbar.dart';
import 'package:lexa/widgets/guiding_paragraph.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/number_pad.dart';
import 'package:lexa/widgets/inputs/pincode.dart';
import 'package:flutter/material.dart';

class PasscodeCreationScreen extends StatefulWidget {
  const PasscodeCreationScreen({super.key});

  @override
  State<PasscodeCreationScreen> createState() => _PasscodeCreationScreenState();
}

class _PasscodeCreationScreenState extends State<PasscodeCreationScreen> {
  final List<String> _numbers = ["", "", "", ""];

  void _submit(BuildContext context, List<String> numbers) {
    if (numbers.last == "") {
      showSnackBar(context, false, "Passcode cant't be empty");
    } else {
      Navigator.pushNamed(context, '/accounts-values');
    }
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
      _submit(context, _numbers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().passcodeCreationScreenTitle)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GuidingParagragh(subTitle: AppTexts().passcodeCreationScreenSubTitle, paragraph: AppTexts().passcodeCreationScreenParagraph),
            Column(
              children: [
                PINCodeInputWidget(numbers: _numbers, secured: true),
                SizedBox(height: Units().spacing),
                NumberPadWidget(numbers: _numbers, update: _update),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
