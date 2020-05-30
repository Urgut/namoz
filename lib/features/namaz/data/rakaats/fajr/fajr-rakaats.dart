import 'package:namazapp/features/namaz/data/factory/kiyam-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kiyam-fatiha-asr-factory.dart';
import 'package:namazapp/features/namaz/data/factory/niet-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-back-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-go-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-first-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-second-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sitting-factory.dart';
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
        PartKiyamFatihaAsrFactory().create(this.gender),
        PartRukuhGoFactory().create(this.gender),
        PartRukuhBackFactory().create(this.gender),
        PartSajdeFirstFactory().create(this.gender),
        PartSittinFactory().create(this.gender),
        PartSajdeSecondFactory().create(this.gender),
      ],
    );

    this.rakaats.add(r1);
  }
}
