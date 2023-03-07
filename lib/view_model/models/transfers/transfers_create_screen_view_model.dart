import 'package:lexa/model/database/local_database.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';

class TransfersCreateScreenViewModel {
  String title = AppTexts().transfersCreateScreenTitle;

  Future<List<String>> getAccounts() async {
    final LocalDatabase localStorage = LocalDatabase();
    List<String> accounts = [];

    List<Map<String, Object?>> databaseAccounts = await localStorage.read("accounts");
    for (var account in databaseAccounts) {
      accounts.add(account["title"].toString());
    }

    return accounts;
  }

  void submit() {}
}
