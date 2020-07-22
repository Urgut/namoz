import 'package:namazapp/features/namaz/data/factory/aguzu-bismilla-factory.dart';
import 'package:namazapp/features/namaz/data/factory/allahumma_barik.factory.dart';
import 'package:namazapp/features/namaz/data/factory/allahumma_salli.factory.dart';
import 'package:namazapp/features/namaz/data/factory/attahiyat-salauat-factory.dart';
import 'package:namazapp/features/namaz/data/factory/fatiha-kausar-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kiyam-factory.dart';
import 'package:namazapp/features/namaz/data/factory/kiyam-fatiha-asr-factory.dart';
import 'package:namazapp/features/namaz/data/factory/niet-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rabbana_atina.factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-back-factory.dart';
import 'package:namazapp/features/namaz/data/factory/rukuh-go-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-first-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sajde-second-factory.dart';
import 'package:namazapp/features/namaz/data/factory/salem-factory.dart';
import 'package:namazapp/features/namaz/data/factory/sitting-factory.dart';
import 'package:namazapp/features/namaz/data/factory/takbir-factory.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

class TwoRakaats {
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
        PartNietFactory().create(this.gender),
        PartTakbirFactory().create(this.gender),
        PartKiyamFactory().create(this.gender),
        PartAguzuBismillaFactory().create(this.gender),
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
      isRakaat: true,
      parts: [
        PartFatihaKausarFactory().create(this.gender),
        PartRukuhGoFactory().create(this.gender),
        PartRukuhBackFactory().create(this.gender),
        PartSajdeFirstFactory().create(this.gender),
        PartSittinFactory().create(this.gender),
        PartSajdeSecondFactory().create(this.gender),
      ],
    );

    NamazRakaatModel otyrys = NamazRakaatModel(
      title: 'otyrys',
      isRakaat: false,
      parts: [
        PartAttahiyatSalauatFactory().create(this.gender),
        PartAllhummaSalliFactory().create(this.gender),
        PartAllhummaBarikFactory().create(this.gender),
        PartRabbanaAtinaFactory().create(this.gender),
        PartSalemFactory().create(this.gender),
      ],
    );

    this.rakaats.add(r1);
    this.rakaats.add(r2);
    this.rakaats.add(otyrys);
  }
}
