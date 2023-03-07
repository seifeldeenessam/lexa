class TransactionModel {
  int? id;
  String type;
  String title;
  num price;
  String? note;
  String category;
  String billingAccount;
  num currentBalance;
  DateTime occurrenceDate;
  DateTime? expiryDate;
  DateTime createdAt;
  DateTime updatedAt;

  TransactionModel({
    this.id,
    required this.type,
    required this.title,
    required this.price,
    required this.note,
    required this.category,
    required this.billingAccount,
    required this.currentBalance,
    required this.occurrenceDate,
    required this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionModel.fromJSON(Map<String, Object?> json) {
    return TransactionModel(
      id: json["id"] as int,
      type: json["type"] as String,
      title: json["title"] as String,
      price: json["price"] as num,
      note: json["note"] as String,
      category: json["category"] as String,
      billingAccount: json["billingAccount"] as String,
      currentBalance: json["currentBalance"] as num,
      occurrenceDate: DateTime.parse(json["occurrenceDate"] as String),
      expiryDate: DateTime.parse(json["expiryDate"] as String),
      createdAt: DateTime.parse(json["createdAt"] as String),
      updatedAt: DateTime.parse(json["updatedAt"] as String),
    );
  }

  Map<String, Object?> toJSON() {
    return {
      "id": id,
      "type": type,
      "title": title,
      "price": price,
      "note": note,
      "category": category,
      "billingAccount": billingAccount,
      "currentBalance": currentBalance,
      "occurrenceDate": occurrenceDate.toIso8601String(),
      "expiryDate": expiryDate,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
