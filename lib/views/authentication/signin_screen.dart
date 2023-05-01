import 'package:lexa/utilities/constants.dart';
import 'package:lexa/viewmodels/authentication.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lexa/widgets/guiding_text.dart';
import 'package:lexa/widgets/inputs/password.dart';
import 'package:lexa/widgets/inputs/phone.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late final Map<String, dynamic> _data;

  void _handleChange(String name, dynamic value, bool parse) {
    setState(() => _data[name] = parse ? num.parse(value) : value);
  }

  String? _phoneNumberValidator(String countryCode, String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return "Phone number can't be empty";
    if (!RegExp(r'^[+0-9]{13}$').hasMatch(countryCode + phoneNumber)) return "Invalid phone number";
    return null;
  }

  String? _passwordValidator(String? password) {
    if (password == null || password.isEmpty) return "Password can't be empty";
    return null;
  }

  @override
  void initState() {
    super.initState();
    _data = {"phone": null, "password": null};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: SignInViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuidingText(subTitle: SignInViewModel().subTitle, paragraph: SignInViewModel().paragraph),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PhoneInputWidget(placeholder: "Phone number", name: "phone", onChange: _handleChange, validator: _phoneNumberValidator),
                    SizedBox(height: Units().spacing / 2),
                    PasswordInputWidget(placeholder: "Password", name: "password", onChange: _handleChange, validator: _passwordValidator),
                    SizedBox(height: Units().spacing),
                    ButtonWidget(action: () => SignInViewModel().submit(context, _formKey, _data), label: "Sign in"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
