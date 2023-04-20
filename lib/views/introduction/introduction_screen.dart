import 'package:lexa/utilities/constants.dart';
import 'package:lexa/utilities/svg_paths.dart';
import 'package:lexa/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lexa/widgets/inputs/password.dart';
import 'package:lexa/widgets/inputs/phone.dart';
import 'package:lexa/validators/password_validator.dart';
import 'package:lexa/validators/phone_number_validator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _signInInfo = {
    "phone": null,
    "password": null,
  };

  void _phoneChange(value) => setState(() => _signInInfo["phone"] = value);
  void _passwordChange(value) => setState(() => _signInInfo["password"] = value);

  void _submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> personalInfo) {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/navigator');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Units().spacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(Units().spacing * 2),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: SvgPicture.asset(SVGPaths().appLogo, colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn)),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PhoneInputWidget(placeholder: "Phone number", onChange: _phoneChange, validator: phoneNumberValidator),
                      SizedBox(height: Units().spacing / 2),
                      PasswordInputWidget(placeholder: "Password", onChange: _passwordChange, validator: passwordValidator),
                      const Expanded(child: SizedBox()),
                      ButtonWidget(action: () => _submit(context, _formKey, _signInInfo), label: "Sign in"),
                      SizedBox(height: Units().spacing / 2),
                      ButtonWidget(action: () => Navigator.pushNamed(context, '/phone-entry'), label: "Sign up for new account", backgroundColor: Colors.transparent),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}