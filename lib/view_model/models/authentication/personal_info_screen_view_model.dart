import 'package:lexa/view_model/functions/show_snackbar.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:flutter/material.dart';

class PersonalInfoEntryScreenViewModel {
  String title = AppTexts().personalInfoScreenTitle;
  String subTitle = AppTexts().personalInfoScreenSubTitle;
  String paragraph = AppTexts().personalInfoScreenParagraph;

  void submit(BuildContext context, Map<String, dynamic> personalInfo) {
    if (personalInfo["name"] == null || personalInfo["email"] == null) {
      showSnackBar(context, false, "Fill all fields");
    } else if (!RegExp(r'^[a-z A-Z ا-ي]+$').hasMatch(personalInfo["name"])) {
      showSnackBar(context, false, "Invalid name");
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(personalInfo["email"])) {
      showSnackBar(context, false, "Invalid email");
    } else {
      Navigator.pushNamed(context, '/passcode-creation');
    }
  }
}
