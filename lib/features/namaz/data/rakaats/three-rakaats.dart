import 'package:namazapp/features/namaz/data/factory/aguzu-bismilla-factory.dart';
import 'package:namazapp/features/namaz/data/factory/attahiyat-factory.dart';
import 'package:namazapp/features/namaz/data/factory/fatiha-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kausar-factory.dart';
import 'package:namazapp/features/namaz/data/factory/subhanaka-factory.dart';
import 'package:namazapp/features/namaz/data/factory/asr-factory.dart';
import 'package:namazapp/features/namaz/data/factory/niet-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-back-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-go-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-first-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-second-factory.dart';
import 'package:namazapp/features/namaz/data/factory/salem-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sitting-factory.dart';
import 'package:namazapp/features/namaz/data/factory/takbir-factory.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

class ThreeRakaats {
  final String gender;
  List<NamazRakaatModel> rakaats = [];

  ThreeRakaats({this.gender}) {
    this.createRakaats();
  }

  createRakaats() {
    NamazRakaatModel r1 = NamazRakaatModel(
      title: '1_rakaat',
      parts: [
        PartNietFactory().create(gender),
        PartTakbirFactory().create(gender),
        FactoryPartSubhanaka().create(gender),
        PartAguzuBismillaFactory().create(gender),
        FatihaPartFactory().create(gender),
        FactoryPartAsrFactory().create(gender),
        PartRukuhGoFactory().create(gender),
        PartRukuhBackFactory().create(gender),
        PartSajdeFirstFactory().create(gender),
        PartSittinFactory().create(gender),
        PartSajdeSecondFactory().create(gender),
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
        PartAttahiyatFactory().create(this.gender),
      ],
    );

    NamazRakaatModel r3 = NamazRakaatModel(
      title: '3_rakaat',
      parts: [
        PartRukuhGoFactory().create(this.gender),
        PartRukuhBackFactory().create(this.gender),
        PartSajdeFirstFactory().create(this.gender),
        PartSittinFactory().create(this.gender),
        PartSajdeSecondFactory().create(this.gender),
        PartSalemFactory().create(this.gender),
      ],
    );

    this.rakaats.add(r1);
    this.rakaats.add(r2);
    this.rakaats.add(r3);
  }
}
