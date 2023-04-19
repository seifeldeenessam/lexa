import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/widgets/guiding_paragraph.dart';
import 'package:lexa/theme/constants.dart';
import 'package:lexa/validators/email_validator.dart';
import 'package:lexa/validators/name_validator.dart';
import 'package:lexa/validators/password_validator.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/button.dart';
import 'package:lexa/widgets/inputs/text.dart';
import 'package:lexa/widgets/inputs/password.dart';
import 'package:flutter/material.dart';

class PersonalInfoEntryScreen extends StatefulWidget {
  const PersonalInfoEntryScreen({super.key});

  @override
  State<PersonalInfoEntryScreen> createState() => _PersonalInfoEntryScreenState();
}

class _PersonalInfoEntryScreenState extends State<PersonalInfoEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _personalInfo = {
    "name": null,
    "email": null,
    "password": null,
  };

  void _nameChange(value) => setState(() => _personalInfo["name"] = value);
  void _emailChange(value) => setState(() => _personalInfo["email"] = value);
  void _passwordChange(value) => setState(() => _personalInfo["password"] = value);

  void _submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> personalInfo) {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/passcode-creation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().personalInfoScreenTitle)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          children: [
            GuidingParagragh(subTitle: AppTexts().personalInfoScreenSubTitle, paragraph: AppTexts().personalInfoScreenParagraph),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextInputWidget(label: "Full name", onChange: _nameChange, validator: nameValidator),
                    SizedBox(height: Units().spacing / 2),
                    TextInputWidget(label: "E-mail", onChange: _emailChange, validator: emailValidator),
                    SizedBox(height: Units().spacing / 2),
                    PasswordInputWidget(placeholder: "Password", onChange: _passwordChange, validator: passwordValidator),
                    SizedBox(height: Units().spacing),
                    ButtonWidget(action: () => _submit(context, _formKey, _personalInfo), label: "Continue"),
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
