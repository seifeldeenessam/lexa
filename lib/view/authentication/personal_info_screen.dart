import 'package:lexa/view/authentication/widgets/guiding_paragraph.dart';
import 'package:lexa/view_model/theme/constants.dart';
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
        padding: const EdgeInsets.all(mainUnit),
        child: Column(
          children: [
            GuidingParagragh(subTitle: PersonalInfoEntryScreenViewModel().subTitle, paragraph: PersonalInfoEntryScreenViewModel().paragraph),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    TextInputWidget(label: "Full name", onChange: _nameChange),
                    const SizedBox(height: mainUnit / 2),
                    TextInputWidget(label: "E-mail", onChange: _emailChange),
                    const SizedBox(height: mainUnit / 2),
                    PasswordInputWidget(placeholder: "Password", validator: passwordValidator, onChange: _passwordChange),
                    const SizedBox(height: mainUnit),
                    ButtonWidget(action: () => PersonalInfoEntryScreenViewModel().submit(context, _personalInfo), label: "Continue"),
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
