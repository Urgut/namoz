import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';
import 'package:namazapp/features/namaz/data/rakaats/fajr/fajr-rakaats.dart';

class NamazFactory {
  /*
    NamazType: 2 sunnet or 2 paryz
  */
  BaseNamaz getNamaz({
    String namazName,
    String namazType,
    bool isSecondSunnet = false,
    String gender = 'man',
  }) {
    if (namazName == null) {
      throw Exception('No namaz');
    }

    // FAJR
    if (namazName == 'fajr') {
      List<NamazRakaatModel> rakaats = FajrRakaats(gender: gender).rakaats;

      return Namaz(
        title: 'fajr',
        type: namazType,
        gender: gender,
        rakaats: rakaats,
      );
    }

    return null;
  }
}
