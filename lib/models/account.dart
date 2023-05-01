import 'package:lexa/models/transaction.dart';

class Account {
  int id;
  String title;
  String currency;
  num value;
  List<Transaction>? transactions;

  Account({required this.id, required this.title, required this.currency, required this.value, this.transactions});

  factory Account.fromJSON(Map<String, dynamic> json) {
    return Account(
      id: json["id"] as int,
      title: json["title"] as String,
      currency: json["currency"] as String,
      value: json["value"] as num,
      transactions: json["transactions"] as List<Transaction>,
    );
  }

  Map<String, dynamic> toJSON() => {"id": id, "title": title, "currency": currency, "value": value};
}
