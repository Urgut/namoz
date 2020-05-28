class NamazPartModel {
  final String title;
  final String description;
  final String image;
  final List<String> audio;
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
    List<String> audioPaths = [];
    if (isAudioExist(jsonData)) {
      for (dynamic i in jsonData['audio']) {
        audioPaths.add(i);
      }
    }

    return NamazPartModel(
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
      audio: audioPaths,
      transcript: jsonData['transcript'],
      translation: jsonData['translation'],
      arabic: jsonData['arabic'],
    );
  }

  static bool isAudioExist(jsonData) =>
      jsonData['audio'] != null &&
      jsonData['audio'] is List &&
      jsonData['audio'].length > 0;
}
