class Statistic {
  String image;
  String title;
  num value;

  Statistic({required this.image, required this.title, required this.value});

  factory Statistic.fromJSON(Map<String, dynamic> json) {
    return Statistic(
      image: json["image"] as String,
      title: json["title"] as String,
      value: json["value"] as num,
    );
  }

  Map<String, dynamic> toJSON() => {"image": image, "title": title, "value": value};
}
