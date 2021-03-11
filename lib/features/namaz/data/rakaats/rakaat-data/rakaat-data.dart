import 'package:namazapp/features/namaz/data/factory/aguzu-bismilla-factory.dart';
import 'package:namazapp/features/namaz/data/factory/allahumma_barik.factory.dart';
import 'package:namazapp/features/namaz/data/factory/allahumma_salli.factory.dart';
import 'package:namazapp/features/namaz/data/factory/asr-factory.dart';
import 'package:namazapp/features/namaz/data/factory/attahiyat-factory.dart';
import 'package:namazapp/features/namaz/data/factory/fatiha-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kunut-factory.dart';
import 'package:namazapp/features/namaz/data/factory/niet-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rabbana_atina.factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-back-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-go-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-first-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-second-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-second-last-factory.dart';
import 'package:namazapp/features/namaz/data/factory/salem-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sitting-factory.dart';
import 'package:namazapp/features/namaz/data/factory/subhanaka-factory.dart';
import 'package:namazapp/features/namaz/data/factory/takbir-factory.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

class RakaatData {
  final String gender;
  RakaatData({this.gender});

  NamazRakaatModel getFirstRakaat() {
    NamazRakaatModel r1 = NamazRakaatModel(
      title: '1_rakaat',
      isRakaat: true,
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

    return r1;
  }

  NamazRakaatModel getSecondRakaat({bool last = false}) {
    NamazRakaatModel r2 = NamazRakaatModel(
      title: '2_rakaat',
      isRakaat: true,
      parts: [
        FatihaPartFactory().create(gender),
        FactoryPartAsrFactory().create(gender),
        PartRukuhGoFactory().create(gender),
        PartRukuhBackFactory().create(gender),
        PartSajdeFirstFactory().create(gender),
        PartSittinFactory().create(gender),
        PartSajdeSecondLastFactory().create(gender),
      ],
    );

    return r2;
  }

  NamazRakaatModel getNthRakaat(String rakatLabel, {isVitrNamaz = false}) {
    NamazRakaatModel r2 = NamazRakaatModel(
      title: rakatLabel,
      isRakaat: true,
      parts: [
        FatihaPartFactory().create(gender),
        PartRukuhGoFactory().create(gender),
        PartRukuhBackFactory().create(gender),
        PartSajdeFirstFactory().create(gender),
        PartSittinFactory().create(gender),
        PartSajdeSecondFactory().create(gender),
      ],
    );

    r2.parts.insert(1, PartKunutFactory().create(gender));

    return r2;
  }

  NamazRakaatModel getOtyrys() {
    NamazRakaatModel otyrys = NamazRakaatModel(
      title: 'otyrys',
      isRakaat: false,
      parts: [
        PartAttahiyatFactory().create(gender),
      ],
    );

    return otyrys;
  }

  NamazRakaatModel getLastOtyrys() {
    NamazRakaatModel otyrys = NamazRakaatModel(
      title: 'last_otyrys',
      isRakaat: false,
      parts: [
        PartAttahiyatFactory().create(gender),
        PartAllhummaSalliFactory().create(gender),
        PartAllhummaBarikFactory().create(gender),
        PartRabbanaAtinaFactory().create(gender),
        PartSalemFactory().create(gender),
      ],
    );

    return otyrys;
  }
}
