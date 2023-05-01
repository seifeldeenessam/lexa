import 'package:lexa/viewmodels/authentication.dart';
import 'package:lexa/widgets/guiding_text.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lexa/widgets/inputs/phone.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final Map<String, dynamic> _data;
  final _formKey = GlobalKey<FormState>();

  void _handleChange(String name, dynamic value, bool parse) {
    setState(() => _data[name] = parse ? num.parse(value) : value);
  }

  String? _phoneNumberValidator(String countryCode, String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return "Phone number can't be empty";
    if (!RegExp(r'^[+0-9]{13}$').hasMatch(countryCode + phoneNumber)) return "Invalid phone number";
    return null;
  }

  @override
  void initState() {
    super.initState();
    _data = {"phone": null};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: SignUpViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuidingText(subTitle: SignUpViewModel().subTitle, paragraph: SignUpViewModel().paragraph),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PhoneInputWidget(placeholder: "Phone number", name: "phone", onChange: _handleChange, validator: _phoneNumberValidator),
                  SizedBox(height: Units().spacing),
                  ButtonWidget(action: () => SignUpViewModel().submit(context, _formKey, _data), label: "Continue"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
