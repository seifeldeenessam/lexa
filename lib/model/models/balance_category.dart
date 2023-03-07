class BalnceCategory {
  String image;
  String title;
  double value;

  BalnceCategory({
    required this.image,
    required this.title,
    required this.value,
  });

  Map<String, dynamic> toJSON() {
    return {
      "image": image,
      "title": title,
      "value": value,
    };
  }
}
