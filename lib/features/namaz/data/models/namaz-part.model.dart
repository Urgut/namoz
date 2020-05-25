class NamazPartModel {
  final String title;
  final String description;
  final String image;
  final String audio;
  final String transcript;
  final String translation;
  final String arabic;

  NamazPartModel({
    this.title,
    this.description,
    this.image,
    this.audio,
    this.transcript,
    this.translation,
    this.arabic,
  });

  factory NamazPartModel.fromJson(Map<String, dynamic> jsonData) {
    return NamazPartModel(
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
      audio: jsonData['audio'],
      transcript: jsonData['transcript'],
      translation: jsonData['translation'],
      arabic: jsonData['arabic'],
    );
  }
}
