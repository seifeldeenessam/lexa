class Balance {
  String image;
  String title;
  num value;

  Balance({required this.image, required this.title, required this.value});

  factory Balance.fromJSON(Map<String, Object?> json) {
    return Balance(
      image: json["image"] as String,
      title: json["title"] as String,
      value: json["value"] as num,
    );
  }

  Map<String, dynamic> toJSON() => {"image": image, "title": title, "value": value};
}
