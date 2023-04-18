import 'package:lexa/view_model/functions/show_snackbar.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/number_pad.dart';
import 'package:lexa/view_model/widgets/inputs/pincode.dart';
import 'package:flutter/material.dart';

class PasscodeEntryScreen extends StatefulWidget {
  const PasscodeEntryScreen({super.key});

  @override
  State<PasscodeEntryScreen> createState() => _PasscodeEntryScreenState();
}

class _PasscodeEntryScreenState extends State<PasscodeEntryScreen> {
  List<String> _numbers = ["", "", "", ""];

  void update(String value) {
    if (_numbers.elementAt(0) == "") {
      setState(() => _numbers[0] = value);
    } else if (_numbers.elementAt(1) == "") {
      setState(() => _numbers[1] = value);
    } else if (_numbers.elementAt(2) == "") {
      setState(() => _numbers[2] = value);
    } else if (_numbers.elementAt(3) == "") {
      setState(() => _numbers[3] = value);
    }
  }

  void delete() {
    if (_numbers.elementAt(3) != "") {
      setState(() => _numbers[3] = "");
    } else if (_numbers.elementAt(2) != "") {
      setState(() => _numbers[2] = "");
    } else if (_numbers.elementAt(1) != "") {
      setState(() => _numbers[1] = "");
    } else if (_numbers.elementAt(0) != "") {
      setState(() => _numbers[0] = "");
    }
  }

  void submit() {
    if (_numbers.last == "") {
      showSnackBar(context, false, "Provide the PIN code");
    } else {
      setState(() => _numbers = ["", "", "", ""]);
      Navigator.pushNamed(context, '/navigator');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("lexa", style: Theme.of(context).textTheme.titleMedium), Text("The Only Wallet You Need", style: Theme.of(context).textTheme.titleMedium)],
            ),
            Column(
              children: [
                PINCodeInputWidget(numbers: _numbers, secured: true),
                SizedBox(height: Units().spacing),
                NumberPadWidget(numbers: _numbers, update: update),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
