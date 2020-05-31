import 'package:namazapp/features/namaz/data/factory/attahiyat-factory.dart';
import 'package:namazapp/features/namaz/data/factory/attahiyat-salauat-factory.dart';
import 'package:namazapp/features/namaz/data/factory/fatiha-factory.dart';
import 'package:namazapp/features/namaz/data/factory/fatiha-kausar-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kiyam-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kiyam-fatiha-asr-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kunut-factory.dart';
import 'package:namazapp/features/namaz/data/factory/niet-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-back-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-go-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-first-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-second-factory.dart';
import 'package:namazapp/features/namaz/data/factory/salem-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sitting-factory.dart';
import 'package:namazapp/features/namaz/data/factory/takbir-factory.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

class ThreeRakaatsVitr {
  final String gender;
  List<NamazRakaatModel> rakaats = [];

  ThreeRakaatsVitr({this.gender}) {
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

    NamazRakaatModel r2 = NamazRakaatModel(
      title: '2_rakaat',
      parts: [
        PartFatihaKausarFactory().create(this.gender),
        PartRukuhGoFactory().create(this.gender),
        PartRukuhBackFactory().create(this.gender),
        PartSajdeFirstFactory().create(this.gender),
        PartSittinFactory().create(this.gender),
        PartSajdeSecondFactory().create(this.gender),
        PartAttahiyatSalauatFactory().create(this.gender),
        PartAttahiyatFactory().create(this.gender),
      ],
    );

    NamazRakaatModel r3 = NamazRakaatModel(
      title: '3_rakaat',
      parts: [
        PartFatihaKausarFactory().create(this.gender),
        PartKunutFactory().create(this.gender),
        PartRukuhGoFactory().create(this.gender),
        PartRukuhBackFactory().create(this.gender),
        PartSajdeFirstFactory().create(this.gender),
        PartSittinFactory().create(this.gender),
        PartSajdeSecondFactory().create(this.gender),
        PartAttahiyatSalauatFactory().create(this.gender),
        PartSalemFactory().create(this.gender),
      ],
    );

    this.rakaats.add(r1);
    this.rakaats.add(r2);
    this.rakaats.add(r3);
  }
}
