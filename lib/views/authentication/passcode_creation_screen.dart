import 'package:lexa/viewmodels/authentication.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/guiding_text.dart';
import 'package:lexa/widgets/inputs/pincode.dart';
import 'package:flutter/material.dart';

class PasscodeCreationScreen extends StatefulWidget {
  const PasscodeCreationScreen({super.key});

  @override
  State<PasscodeCreationScreen> createState() => _PasscodeCreationScreenState();
}

class _PasscodeCreationScreenState extends State<PasscodeCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  late final Map<String, List<String>> _data;

  void _add(String value) {
    if (_data["passcode"]!.elementAt(0) == "") {
      setState(() => _data["passcode"]![0] = value);
    } else if (_data["passcode"]!.elementAt(1) == "") {
      setState(() => _data["passcode"]![1] = value);
    } else if (_data["passcode"]!.elementAt(2) == "") {
      setState(() => _data["passcode"]![2] = value);
    } else if (_data["passcode"]!.elementAt(3) == "") {
      setState(() => _data["passcode"]![3] = value);
      PasscodeCreateViewModel().submit(context, _formKey, _data);
    }
  }

  void _remove() {
    if (_data["passcode"]!.elementAt(3) != "") {
      setState(() => _data["passcode"]![3] = "");
    } else if (_data["passcode"]!.elementAt(2) != "") {
      setState(() => _data["passcode"]![2] = "");
    } else if (_data["passcode"]!.elementAt(1) != "") {
      setState(() => _data["passcode"]![1] = "");
    } else if (_data["passcode"]!.elementAt(0) != "") {
      setState(() => _data["passcode"]![0] = "");
    }
  }

  @override
  void initState() {
    super.initState();
    _data = {
      "passcode": ["", "", "", ""]
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: PasscodeCreateViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GuidingText(subTitle: PasscodeCreateViewModel().subTitle, paragraph: PasscodeCreateViewModel().paragraph),
            Form(
              key: _formKey,
              child: PINCodeInputWidget(numbers: _data["passcode"]!, add: _add, remove: _remove, secured: true),
            ),
          ],
        ),
      ),
    );
  }
}
