import 'package:lexa/view/authentication/widgets/guiding_paragraph.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/validators/email_validator.dart';
import 'package:lexa/view_model/validators/name_validator.dart';
import 'package:lexa/view_model/validators/password_validator.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/models/authentication/personal_info_screen_view_model.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:lexa/view_model/widgets/inputs/text.dart';
import 'package:lexa/view_model/widgets/inputs/password.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: PersonalInfoEntryScreenViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          children: [
            GuidingParagragh(subTitle: PersonalInfoEntryScreenViewModel().subTitle, paragraph: PersonalInfoEntryScreenViewModel().paragraph),
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
                    ButtonWidget(action: () => PersonalInfoEntryScreenViewModel().submit(context, _formKey, _personalInfo), label: "Continue"),
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
