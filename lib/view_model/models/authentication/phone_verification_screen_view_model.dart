import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:flutter/material.dart';

class PhoneVerificationScreenViewModel {
  String title = AppTexts().phoneVerificationScreenTitle;
  String subTitle = AppTexts().phoneVerificationScreenSubTitle;
  String paragraph = AppTexts().phoneVerificationScreenParagraph;

  void submit(BuildContext context, GlobalKey<FormState> formKey, List<String> numbers) {
    if (formKey.currentState!.validate()) Navigator.pushNamed(context, '/personal-info');
  }
}
