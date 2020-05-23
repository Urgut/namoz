class TaharatModel {
  final String title;
  final String description;
  final List<String> images;
  final String section;

  TaharatModel({
    this.title,
    this.description,
    this.images,
    this.section,
  });

  factory TaharatModel.fromJson(Map<String, dynamic> jsonData) {
    return TaharatModel(
      title: jsonData['title'],
      description: jsonData['description'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = Map<String, dynamic>();

    result['title'] = this.title;
    result['description'] = this.description;

    return result;
  }
}
