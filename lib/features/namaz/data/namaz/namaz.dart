import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';

class Namaz implements BaseNamaz {
  String title;
  String type;
  String gender;
  List<NamazRakaatModel> rakaats;

  Namaz({
    this.title,
    this.type,
    this.gender,
    this.rakaats,
  });

  // get rakaatsCount => this.rakaats.length;
  // get isForMan => this.gender == 'man';
  // get isSecondSunna => this.type == 'sunna_second';
}
