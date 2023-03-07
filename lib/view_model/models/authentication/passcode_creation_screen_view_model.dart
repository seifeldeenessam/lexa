import 'package:lexa/view_model/functions/show_snackbar.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:flutter/material.dart';

class PasscodeCreationScreenViewModel {
  String title = AppTexts().passcodeCreationScreenTitle;
  String subTitle = AppTexts().passcodeCreationScreenSubTitle;
  String paragraph = AppTexts().passcodeCreationScreenParagraph;

  void submit(BuildContext context, List<String> numbers) {
    if (numbers.last == "") {
      showSnackBar(context, false, "Passcode cant't be empty");
    } else {
      Navigator.pushNamed(context, '/accounts-values');
    }
  }
}
