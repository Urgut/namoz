class PreviewArticleModel {
  final String title;
  final String text;

  PreviewArticleModel({
    this.title,
    this.text,
  });

  factory PreviewArticleModel.fromJson(Map<String, dynamic> jsonData) {
    return PreviewArticleModel(
      title: jsonData['title'],
      text: jsonData['text'],
    );
  }
}
