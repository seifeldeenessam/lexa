import 'package:lexa/viewmodels/authentication.dart';
import 'package:lexa/widgets/guiding_text.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/widgets/app_bar.dart';
import 'package:lexa/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lexa/widgets/inputs/password.dart';
import 'package:lexa/widgets/inputs/text.dart';

class PersonalInfoEntryScreen extends StatefulWidget {
  const PersonalInfoEntryScreen({super.key});

  @override
  State<PersonalInfoEntryScreen> createState() => _PersonalInfoEntryScreenState();
}

class _PersonalInfoEntryScreenState extends State<PersonalInfoEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  late final Map<String, dynamic> _data;

  void _handleChange(String name, dynamic value, bool parse) {
    setState(() => _data[name] = parse ? num.parse(value) : value);
  }

  String? _nameValidator(String? name) {
    if (name == null || name.isEmpty) return "Name can't be empty";
    if (!RegExp(r'^[a-z A-Z ا-ي]+$').hasMatch(name)) return "Invalid name";
    return null;
  }

  String? _emailValidator(String? email) {
    if (email == null || email.isEmpty) return "Email can't be empty";
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) return "Invalid email";
    return null;
  }

  String? _passwordValidator(String? password) {
    if (password == null || password.isEmpty) return "Password can't be empty";
    return null;
  }

  @override
  void initState() {
    super.initState();
    _data = {"name": null, "email": null, "password": null};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: PersonalInfoViewModel().title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          children: [
            GuidingText(subTitle: PersonalInfoViewModel().subTitle, paragraph: PersonalInfoViewModel().paragraph),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextInputWidget(label: "Full name", name: "name", onChange: _handleChange, validator: _nameValidator),
                    SizedBox(height: Units().spacing / 2),
                    TextInputWidget(label: "E-mail", name: "email", onChange: _handleChange, validator: _emailValidator),
                    SizedBox(height: Units().spacing / 2),
                    PasswordInputWidget(placeholder: "Password", name: "password", onChange: _handleChange, validator: _passwordValidator),
                    SizedBox(height: Units().spacing),
                    ButtonWidget(action: () => PersonalInfoViewModel().submit(context, _formKey, _data), label: "Continue"),
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
