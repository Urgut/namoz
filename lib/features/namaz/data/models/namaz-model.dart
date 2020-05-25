import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

class NamazModel {
  final String title;
  final String mode;
  final List<NamazRakaatModel> rakaats;

  NamazModel({
    this.title,
    this.mode,
    this.rakaats,
  });

  factory NamazModel.fromJson(Map<String, dynamic> jsonData) {
    // Rakaats
    List<NamazRakaatModel> rakaats = [];

    if (isRakaatExists(jsonData['result']['rakaats'])) {
      for (dynamic i in jsonData['result']['rakaats']) {
        rakaats.add(NamazRakaatModel.fromJson(i));
      }
    }

    return NamazModel(
      title: jsonData['result']['title'],
      mode: jsonData['result']['mode'],
      rakaats: rakaats,
    );
  }

  static bool isRakaatExists(j) {
    return j != null && j.length > 0;
  }
}
