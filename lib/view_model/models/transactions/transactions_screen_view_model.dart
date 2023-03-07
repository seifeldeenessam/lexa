import 'package:lexa/model/database/local_database.dart';

class TransactionsScreenViewModel {
  Future<List<Map<String, dynamic>>> loadData() async {
    late List<Map<String, dynamic>> transactions;

    final LocalDatabase localStorage = LocalDatabase();
    await localStorage.read("transactions").then((value) => transactions = value);

    return transactions;
  }
}
