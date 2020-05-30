import 'package:namazapp/features/namaz/data/factory/kiyam-factory.dart';
import 'package:namazapp/features/namaz/data/factory/niet-factory.dart';
import 'package:namazapp/features/namaz/data/factory/takbir-factory.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

class FajrRakaats {
  final String gender;
  List<NamazRakaatModel> rakaats = [];

  FajrRakaats({this.gender}) {
    this.createRakaats();
  }

  createRakaats() {
    NamazRakaatModel r1 = NamazRakaatModel(
      title: '1_rakaat',
      parts: [
        PartNietFactory().create(this.gender),
        PartTakbirFactory().create(this.gender),
        PartKiyamFactory().create(this.gender),
      ],
    );

    this.rakaats.add(r1);
  }
}
