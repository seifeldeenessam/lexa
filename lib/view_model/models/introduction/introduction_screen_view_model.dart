import 'package:flutter/material.dart';

class IntroductionScreenViewModel {
  void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> personalInfo) {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/navigator');
  }
}
