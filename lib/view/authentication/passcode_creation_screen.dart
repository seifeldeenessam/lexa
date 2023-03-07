import 'package:lexa/view/authentication/widgets/guiding_paragraph.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/models/authentication/passcode_creation_screen_view_model.dart';
import 'package:lexa/view_model/widgets/number_pad.dart';
import 'package:lexa/view_model/widgets/inputs/pincode.dart';
import 'package:flutter/material.dart';

class PasscodeCreationScreen extends StatefulWidget {
  const PasscodeCreationScreen({super.key});

  @override
  State<PasscodeCreationScreen> createState() => _PasscodeCreationScreenState();
}

class _PasscodeCreationScreenState extends State<PasscodeCreationScreen> {
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
      PasscodeCreationScreenViewModel().submit(context, _numbers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: PasscodeCreationScreenViewModel().title)),
      body: Padding(
        padding: const EdgeInsets.all(mainUnit),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GuidingParagragh(subTitle: PasscodeCreationScreenViewModel().subTitle, paragraph: PasscodeCreationScreenViewModel().paragraph),
            Column(
              children: [
                PINCodeInputWidget(numbers: _numbers, secured: true),
                const SizedBox(height: mainUnit),
                NumberPadWidget(numbers: _numbers, update: _update),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
