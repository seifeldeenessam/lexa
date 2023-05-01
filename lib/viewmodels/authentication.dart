import 'package:flutter/material.dart';
import 'package:lexa/utilities/get_data_from_json.dart';

@immutable
abstract class AuthenticationViewModel {}

class SignInViewModel extends AuthenticationViewModel {
  final String title = "Sign in";
  final String subTitle = "Welcome back";
  final String paragraph = "Provide your account phone number and password in order to sign into your account.";

  void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> data) async {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/');
  }
}

class SignUpViewModel extends AuthenticationViewModel {
  final String title = "Sign up";
  final String subTitle = "Welcome to Lexa";
  final String paragraph = "In order to get started, you have to provide your real phone number below to help us authenticate your experience.";

  void submit(BuildContext context, GlobalKey<FormState> formKey, Map<String, dynamic> data) async {
    if (formKey.currentState!.validate()) Navigator.pushNamed(context, '/auth/phone-number/verify');
  }
}

class PhoneVerifyViewModel extends AuthenticationViewModel {
  final String title = "Phone verification";
  final String subTitle = "Check your SMS app";
  final String paragraph = "We have sent a PIN to the phone number you provided earlier. To continue, enter it below.";

  void submit(BuildContext context, GlobalKey<FormState> formKey, Map<String, dynamic> data) async {
    if (formKey.currentState!.validate()) Navigator.pushNamed(context, '/auth/personal-info');
  }
}

class PersonalInfoViewModel extends AuthenticationViewModel {
  final String title = "Personal info";
  final String subTitle = "Create an account";
  final String paragraph = "We have noticed from the phone number you provided earlier that you are new here. so you we need to know some information about you in order to get started.";

  void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> data) async {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/auth/passcode/create');
  }
}

class PasscodeCreateViewModel extends AuthenticationViewModel {
  final String title = "Passcode";
  final String subTitle = "Wallet passcode";
  final String paragraph = "To add an extra layer of security to your wallet, you can lock it by setting a 4 digit passcode, which will be required every time you try to access your wallet.";

  void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> data) async {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/auth/accounts-values');
  }
}

class AccountsCreateViewModel extends AuthenticationViewModel {
  final String title = "Accounts";
  final String subTitle = "Before you start";
  final String paragraph = "You will have three accounts cash, bank, and savings. These accounts are here to manage and store your money in a much more organised way. So before you start, enter the amount of money you have in each account.";

  Future<List<Map>> getCurrenciesList() async {
    Map<String, dynamic> currencies = {};
    List<Map> currenciesList = [];
    await getDataFromJSON('assets/data/currencies.json').then((value) => currencies = value);
    currencies.forEach((key, value) => currenciesList.add(value));
    return currenciesList;
  }

  // void setAccounts(BuildContext context, Map<String, dynamic> data, SQLite database) async {
  //   final Account account = Account(id: data["id"], title: data["title"], currency: data["currency"], value: data["value"]);
  //   await database.insertAccountsValues(account.toJSON());
  //   if (context.mounted) {
  //     showSnackBar(context, true, "Accounts are successfully set");
  //     Future.delayed(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
  //   }
  // }

  // void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> data) async {
  //   final SQLite database = SQLite();
  //   List<Map<String, dynamic>> accounts = await database.read("accounts");
  //   if (context.mounted) {
  //     if (accounts.isNotEmpty) Navigator.pushNamed(context, '/auth/navigator');
  //     if (formkey.currentState!.validate()) setAccounts(context, data, database);
  //   }
  // }

  void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> data) async {
    if (formkey.currentState!.validate()) Navigator.pushNamed(context, '/');
  }
}
