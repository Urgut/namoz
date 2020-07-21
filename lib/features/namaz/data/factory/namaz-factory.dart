import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';
import 'package:namazapp/features/namaz/data/rakaats/fajr/four-rakaats.dart';
import 'package:namazapp/features/namaz/data/rakaats/fajr/three-rakaats-vitr.dart';
import 'package:namazapp/features/namaz/data/rakaats/fajr/three-rakaats.dart';
import 'package:namazapp/features/namaz/data/rakaats/fajr/two-rakaats.dart';

class NamazFactory {
  /*
    @param namazName - fajr
    @oaram namazType - 2_rakaat_sunna
    @param isSecondSunnet
    @param gender - man or woman
    NamazType: 2 sunnet or 2 paryz
  */
  Namaz getNamaz({
    String namazName,
    String namazType,
    bool isSecondSunnet = false,
    String gender = 'man',
  }) {
    if (namazName == null) {
      throw Exception('namaz_not_found');
    }

    List<NamazRakaatModel> rakaats = [];

    // Fajr
    if (namazName == 'fajr') {
      rakaats = TwoRakaats(gender: gender).rakaats;
    }

    // Dhuhr
    if (namazName == 'dhuhr') {
      switch (namazType) {
        case 'sunna':
        case 'paryz':
          rakaats = FourRakaats(gender: gender).rakaats;
          break;
        case 'sunna_second':
          rakaats = TwoRakaats(gender: gender).rakaats;
          break;
      }
    }

    // Asr
    if (namazName == 'asr') {
      rakaats = FourRakaats(gender: gender).rakaats;
    }

    // Magrib
    if (namazName == 'magrib') {
      switch (namazType) {
        case 'paryz':
          rakaats = ThreeRakaats(gender: gender).rakaats;
          break;
        case 'sunna':
          rakaats = TwoRakaats(gender: gender).rakaats;
          break;
      }
    }

    // Isha
    if (namazName == 'isha') {
      switch (namazType) {
        case 'paryz':
          rakaats = FourRakaats(gender: gender).rakaats;
          break;
        case 'sunna':
          rakaats = TwoRakaats(gender: gender).rakaats;
          break;
      }
    }

    // Vitr
    if (namazName == 'vitr') {
      rakaats = ThreeRakaatsVitr(gender: gender).rakaats;
    }

    return Namaz(
      title: namazName,
      type: namazType,
      gender: gender,
      rakaats: rakaats,
    );
  }
}
