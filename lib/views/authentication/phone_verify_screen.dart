import 'package:lexa/viewmodels/authentication.dart';
import 'package:lexa/widgets/guiding_text.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/inputs/pincode.dart';
import 'package:flutter/material.dart';

class PhoneVerifyScreen extends StatefulWidget {
  const PhoneVerifyScreen({super.key});

  @override
  State<PhoneVerifyScreen> createState() => _PhoneVerifyScreenState();
}

class _PhoneVerifyScreenState extends State<PhoneVerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  late final Map<String, List<String>> _data;

  void _add(String value) {
    if (_data["pin"]!.elementAt(0) == "") {
      setState(() => _data["pin"]![0] = value);
    } else if (_data["pin"]!.elementAt(1) == "") {
      setState(() => _data["pin"]![1] = value);
    } else if (_data["pin"]!.elementAt(2) == "") {
      setState(() => _data["pin"]![2] = value);
    } else if (_data["pin"]!.elementAt(3) == "") {
      setState(() => _data["pin"]![3] = value);
      PhoneVerifyViewModel().submit(context, _formKey, _data);
    }
  }

  void _remove() {
    if (_data["pin"]!.elementAt(3) != "") {
      setState(() => _data["pin"]![3] = "");
    } else if (_data["pin"]!.elementAt(2) != "") {
      setState(() => _data["pin"]![2] = "");
    } else if (_data["pin"]!.elementAt(1) != "") {
      setState(() => _data["pin"]![1] = "");
    } else if (_data["pin"]!.elementAt(0) != "") {
      setState(() => _data["pin"]![0] = "");
    }
  }

  @override
  void initState() {
    super.initState();
    _data = {
      "pin": ["", "", "", ""]
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: PhoneVerifyViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuidingText(subTitle: PhoneVerifyViewModel().subTitle, paragraph: PhoneVerifyViewModel().paragraph),
            Form(
              key: _formKey,
              child: PINCodeInputWidget(numbers: _data["pin"]!, add: _add, remove: _remove),
            ),
          ],
        ),
      ),
    );
  }
}
