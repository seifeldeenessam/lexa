import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:flutter/material.dart';

class PersonalInfoEntryScreenViewModel {
  String title = AppTexts().personalInfoScreenTitle;
  String subTitle = AppTexts().personalInfoScreenSubTitle;
  String paragraph = AppTexts().personalInfoScreenParagraph;

  void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> personalInfo) {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/passcode-creation');
  }
}
