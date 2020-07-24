import 'package:namazapp/core/data/datasources/gender.data.dart';
import 'package:namazapp/core/data/datasources/namaz-type-list.data.dart';
import 'package:namazapp/core/data/datasources/namaz-list.data.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/models/namaz-wrapper.model.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';
import 'package:namazapp/features/namaz/data/rakaats/base-rakaats.dart';
import 'package:namazapp/features/namaz/data/rakaats/four-rakaats.dart';
import 'package:namazapp/features/namaz/data/rakaats/three-rakaats-vitr.dart';
import 'package:namazapp/features/namaz/data/rakaats/three-rakaats.dart';
import 'package:namazapp/features/namaz/data/rakaats/two-rakaats.dart';

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
        parts: twoRakaatsSunna.getParts(),
      );

      namazList.add(fajrTwoRakaatSunnaNamaz);
      namazList.add(fajrTwoRakaatParyzNamaz);
    }

    // Dhuhr
    if (period == NamazListData.dhuhr) {
      // Sunnet namazy
      BaseRakaats fourRakaats = FourRakaats(gender: gender);

      Namaz fajrTwoRakaatSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.fourRakaatSunna,
        rakaats: fourRakaats.rakaats,
        parts: fourRakaats.getParts(),
      );

      // Paryz namazy
      BaseRakaats fourRakaatsParyz = FourRakaats(gender: gender);

      Namaz fourRakaatParyzNamaz = Namaz(
        period: period,
        title: NamazTypeListData.fourRakaatParyz,
        rakaats: fourRakaatsParyz.rakaats,
        parts: fourRakaatsParyz.getParts(),
      );

      BaseRakaats twoRakaatsSunna = TwoRakaats(gender: gender);

      Namaz dhuhrTwoRakaatSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatSunna,
        rakaats: twoRakaatsSunna.rakaats,
        parts: twoRakaatsSunna.getParts(),
      );

      namazList.add(fajrTwoRakaatSunnaNamaz);
      namazList.add(fourRakaatParyzNamaz);
      namazList.add(dhuhrTwoRakaatSunnaNamaz);
    }

    // Asr
    if (period == NamazListData.asr) {
      // Paryz namazy
      BaseRakaats asrFourRakaats = FourRakaats(gender: gender);

      Namaz asrNamaz = Namaz(
        period: period,
        title: NamazTypeListData.fourRakaatParyz,
        rakaats: asrFourRakaats.rakaats,
        parts: asrFourRakaats.getParts(),
      );

      namazList.add(asrNamaz);
    }

    // Magrib
    if (period == NamazListData.magrib) {
      // Paryz namazy
      BaseRakaats magribThreeRakaats = ThreeRakaats(gender: gender);

      Namaz magribParyzNamaz = Namaz(
        period: period,
        title: NamazTypeListData.threeRakaatParyz,
        rakaats: magribThreeRakaats.rakaats,
        parts: magribThreeRakaats.getParts(),
      );

      // 2 sunna
      BaseRakaats magribSunnaRakaats = TwoRakaats(gender: gender);

      Namaz magribSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatSunna,
        rakaats: magribSunnaRakaats.rakaats,
        parts: magribSunnaRakaats.getParts(),
      );

      namazList.add(magribParyzNamaz);
      namazList.add(magribSunnaNamaz);
    }

    // ISHA
    if (period == NamazListData.isha) {
      // Paryz namazy
      BaseRakaats ishaFourRakaats = FourRakaats(gender: gender);
      Namaz ishaParyzNamaz = Namaz(
        period: period,
        title: NamazTypeListData.fourRakaatParyz,
        rakaats: ishaFourRakaats.rakaats,
        parts: ishaFourRakaats.getParts(),
      );

      BaseRakaats ishaSunnaRakaats = TwoRakaats(gender: gender);
      Namaz ishaSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatSunna,
        rakaats: ishaSunnaRakaats.rakaats,
        parts: ishaSunnaRakaats.getParts(),
      );

      namazList.add(ishaParyzNamaz);
      namazList.add(ishaSunnaNamaz);
    }

    // VITR
    if (period == NamazListData.vitr) {
      BaseRakaats vitrRakaats = ThreeRakaatsVitr(gender: gender);

      Namaz vitrNamaz = Namaz(
        period: period,
        title: NamazTypeListData.threeRakaatVitr,
        rakaats: vitrRakaats.rakaats,
        parts: vitrRakaats.getParts(),
      );

      namazList.add(vitrNamaz);
    }

    return NamazWrapper(
      title: period,
      icon: "",
      namazList: namazList,
    );
  }
}
