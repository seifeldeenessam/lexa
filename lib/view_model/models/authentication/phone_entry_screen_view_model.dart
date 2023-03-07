import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:flutter/material.dart';

class PhoneEntryScreenViewModel {
  String title = AppTexts().phoneEntryScreenTitle;
  String subTitle = AppTexts().phoneEntryScreenSubTitle;
  String paragraph = AppTexts().phoneEntryScreenParagraph;

  void submit(BuildContext context, GlobalKey<FormState> formKey, String? phone) {
    if (formKey.currentState!.validate()) Navigator.pushNamed(context, '/phone-verification');
  }
}
