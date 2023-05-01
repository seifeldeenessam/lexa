class Bookmark {
  int? id;
  String title;
  num? price;
  String? note;
  String? link;
  int isImportant;
  int isChecked;
  DateTime? createdAt;
  DateTime? updatedAt;

  Bookmark({
    this.id,
    required this.title,
    this.price,
    this.note,
    this.link,
    required this.isImportant,
    required this.isChecked,
    this.createdAt,
    this.updatedAt,
  });

  factory Bookmark.fromJSON(Map<String, dynamic> json) {
    return Bookmark(
      id: json["id"] as int,
      title: json["title"] as String,
      price: json["price"] as num,
      note: json["note"] as String,
      link: json["link"] as String,
      isImportant: json["isImportant"] as int,
      isChecked: json["isChecked"] as int,
      createdAt: DateTime.parse(json["createdAt"] as String),
      updatedAt: DateTime.parse(json["updatedAt"] as String),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "note": note,
      "link": link,
      "isImportant": isImportant,
      "isChecked": isChecked,
      "createdAt": createdAt!.toIso8601String(),
      "updatedAt": updatedAt!.toIso8601String(),
    };
  }
}
