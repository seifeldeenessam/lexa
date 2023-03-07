import 'package:lexa/model/models/transaction.dart';

class Account {
  int id;
  String title;
  num value;
  List<TransactionModel>? transactions;

  Account({required this.id, required this.title, required this.value, this.transactions});

  factory Account.fromJSON(Map<String, Object?> json) {
    return Account(
      id: json["id"] as int,
      title: json["title"] as String,
      value: json["price"] as num,
      transactions: json["transactions"] as List<TransactionModel>,
    );
  }

  Map<String, Object?> toJSON() => {"id": id, "title": title, "value": value};
}
