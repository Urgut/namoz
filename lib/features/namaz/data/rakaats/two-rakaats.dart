import 'package:namazapp/features/namaz/data/factory/aguzu-bismilla-factory.dart';
import 'package:namazapp/features/namaz/data/factory/allahumma_barik.factory.dart';
import 'package:namazapp/features/namaz/data/factory/allahumma_salli.factory.dart';
import 'package:namazapp/features/namaz/data/factory/attahiyat-factory.dart';
import 'package:namazapp/features/namaz/data/factory/fatiha-factory.dart';
import 'package:namazapp/features/namaz/data/factory/subhanaka-factory.dart';
import 'package:namazapp/features/namaz/data/factory/asr-factory.dart';
import 'package:namazapp/features/namaz/data/factory/niet-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rabbana_atina.factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-back-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-go-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-first-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-second-factory.dart';
import 'package:namazapp/features/namaz/data/factory/salem-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sitting-factory.dart';
import 'package:namazapp/features/namaz/data/factory/takbir-factory.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/rakaats/base-rakaats.dart';

class TwoRakaats extends BaseRakaats {
  final String gender;
  List<NamazRakaatModel> rakaats = [];

  TwoRakaats({this.gender}) {
    this.createRakaats();
  }

  createRakaats() {
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
        PartSajdeSecondFactory().create(gender),
      ],
    );

    NamazRakaatModel otyrys = NamazRakaatModel(
      title: 'otyrys',
      isRakaat: false,
      parts: [
        PartAttahiyatFactory().create(gender),
        PartAllhummaSalliFactory().create(gender),
        PartAllhummaBarikFactory().create(gender),
        PartRabbanaAtinaFactory().create(gender),
        PartSalemFactory().create(gender),
      ],
    );

    this.rakaats.add(r1);
    this.rakaats.add(r2);
    this.rakaats.add(otyrys);
  }

  List<IPart> getParts() {
    List<IPart> parts = [];

    if (this.rakaats != null) {
      // Change rakaatName
      this.rakaats.map((NamazRakaatModel r) {
        String rakaatTitle = r.title;

        print('RR: $rakaatTitle');

        r.parts.map((p) {
          p.rakaatName = rakaatTitle;
          return p;
        }).toList();

        return r;
      }).toList();

      // Combine all namaz's parts in one list
      for (int i = 0; i < this.rakaats.length; i++) {
        parts.addAll(this.rakaats[i].parts);
      }
    }

    return parts;
  }
}
