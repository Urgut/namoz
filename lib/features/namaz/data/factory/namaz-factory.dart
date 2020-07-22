import 'package:namazapp/core/data/datasources/gender.data.dart';
import 'package:namazapp/core/data/datasources/namaz-type-list.data.dart';
import 'package:namazapp/core/data/datasources/namaz-list.data.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/models/namaz-wrapper.model.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';
import 'package:namazapp/features/namaz/data/rakaats/fajr/base-rakaats.dart';
import 'package:namazapp/features/namaz/data/rakaats/fajr/two-rakaats.dart';

class NamazFactory {
  /*
    @param namazName - fajr
    @oaram namazType - sunna    
    @param gender - man or woman    
  */
  NamazWrapper getNamaz({
    String period,
    String gender = GenderData.man,
  }) {
    if (period == null) {
      throw Exception('namaz_not_found');
    }

    List<Namaz> namazList = [];

    // Fajr
    if (period == NamazListData.fajr) {
      // Sunnet namazy
      BaseRakaats twoRakaatsSunna = TwoRakaats(gender: gender);

      Namaz fajrTwoRakaatSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatSunna,
        rakaats: twoRakaatsSunna.rakaats,
        parts: twoRakaatsSunna.getParts(),
      );

      // Paryz namazy
      List<NamazRakaatModel> twoRakaatsParyz =
          TwoRakaats(gender: gender).rakaats;

      Namaz fajrTwoRakaatParyzNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatParyz,
        rakaats: twoRakaatsParyz,
        parts: [],
      );

      namazList.add(fajrTwoRakaatSunnaNamaz);
      namazList.add(fajrTwoRakaatParyzNamaz);
    }

    return NamazWrapper(
      title: period,
      icon: "",
      namazList: namazList,
    );

    // Dhuhr
    // if (namazName == NamazListData.dhuhr) {
    //   switch (namazType) {
    //     case NamazTypeListData.fourRakaatSunna:
    //     case NamazTypeListData.fourRakaatParyz:
    //       rakaats = FourRakaats(gender: gender).rakaats;
    //       break;
    //     case NamazTypeListData.twoRakaatSunna:
    //       rakaats = TwoRakaats(gender: gender).rakaats;
    //       break;
    //   }
    // }

    // // Asr
    // if (namazName == NamazListData.asr) {
    //   rakaats = FourRakaats(gender: gender).rakaats;
    // }

    // // Magrib
    // if (namazName == NamazListData.magrib) {
    //   switch (namazType) {
    //     case NamazTypeListData.threeRakaatParyz:
    //       rakaats = ThreeRakaats(gender: gender).rakaats;
    //       break;
    //     case NamazTypeListData.twoRakaatSunna:
    //       rakaats = TwoRakaats(gender: gender).rakaats;
    //       break;
    //   }
    // }

    // // Isha
    // if (namazName == NamazListData.isha) {
    //   switch (namazType) {
    //     case NamazTypeListData.fourRakaatParyz:
    //       rakaats = FourRakaats(gender: gender).rakaats;
    //       break;
    //     case NamazTypeListData.twoRakaatSunna:
    //       rakaats = TwoRakaats(gender: gender).rakaats;
    //       break;
    //   }
    // }

    // // Vitr
    // if (namazName == NamazListData.isha) {
    //   rakaats = ThreeRakaatsVitr(gender: gender).rakaats;
    // }

    // return Namaz(
    //   title: namazName,
    //   gender: gender,
    //   rakaats: rakaats,
    // );
  }
}
