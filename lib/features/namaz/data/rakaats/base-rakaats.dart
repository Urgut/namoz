import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

abstract class BaseRakaats {
  String gender;
  List<NamazRakaatModel> rakaats = [];
  createRakaats();
  getParts();
}
