import 'package:namazapp/features/namaz/data/models/namaz-part.model.dart';

class NamazRakaatModel {
  final String title;
  final List<NamazPartModel> parts;

  NamazRakaatModel({
    this.title,
    this.parts,
  });

  factory NamazRakaatModel.fromJson(Map<String, dynamic> jsonData) {
    List<NamazPartModel> parts = [];

    if (jsonData['parts'] != null) {
      for (dynamic i in jsonData['parts']) {
        parts.add(NamazPartModel.fromJson(i));
      }
    }

    return NamazRakaatModel(
      title: jsonData['title'],
      parts: parts,
    );
  }
}
