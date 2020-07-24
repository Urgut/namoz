import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/rakaats/base-rakaats.dart';
import 'package:namazapp/features/namaz/data/rakaats/helpers/rakaat-helper.dart';
import 'package:namazapp/features/namaz/data/rakaats/rakaat-data/rakaat-data.dart';

class ThreeRakaats extends BaseRakaats {
  final String gender;
  List<NamazRakaatModel> rakaats = [];

  ThreeRakaats({this.gender}) {
    this.createRakaats();
  }

  createRakaats() {
    NamazRakaatModel r1 = RakaatData(gender: this.gender).getFirstRakaat();
    NamazRakaatModel r2 = RakaatData(gender: this.gender).getSecondRakaat();
    NamazRakaatModel otyrys = RakaatData(gender: this.gender).getOtyrys();
    NamazRakaatModel r3 =
        RakaatData(gender: this.gender).getNthRakaat('3_rakaat');

    NamazRakaatModel lastOtyrys =
        RakaatData(gender: this.gender).getLastOtyrys();

    this.rakaats.add(r1);
    this.rakaats.add(r2);
    this.rakaats.add(otyrys);
    this.rakaats.add(r3);
    this.rakaats.add(lastOtyrys);
  }

  List<IPart> getParts() {
    return RakaatHelper(this.rakaats).getParts();
  }
}
