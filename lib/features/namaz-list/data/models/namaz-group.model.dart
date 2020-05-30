import 'package:namazapp/features/namaz-list/data/models/namaz-short.model.dart';

class NamazGroupModel {
  String title;
  String description;
  List<NamazShortModel> namazs;

  NamazGroupModel({
    this.title,
    this.description,
    this.namazs,
  });
}
