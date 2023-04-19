class BalnceCategory {
  String image;
  String title;
  num value;

  BalnceCategory({required this.image, required this.title, required this.value});

  factory BalnceCategory.fromJSON(Map<String, Object?> json) {
    return BalnceCategory(
      image: json["image"] as String,
      title: json["title"] as String,
      value: json["value"] as num,
    );
  }

  Map<String, dynamic> toJSON() => {"image": image, "title": title, "value": value};
}
