class Card {
  String id;
  String image;
  String title;
  String type;
  bool isFavorite;
  DateTime createdAt;
  DateTime updatedAt;

  Card({
    required this.id,
    required this.image,
    required this.title,
    required this.type,
    required this.isFavorite,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Card.fromJSON(Map<String, dynamic> json) {
    return Card(
      id: json["id"] as String,
      image: json["image"] as String,
      title: json["title"] as String,
      type: json["type"] as String,
      isFavorite: json["isFavorite"] == 1,
      createdAt: DateTime.parse(json["createdAt"] as String),
      updatedAt: DateTime.parse(json["updatedAt"] as String),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "type": type,
      "isFavorite": isFavorite ? 1 : 0,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
