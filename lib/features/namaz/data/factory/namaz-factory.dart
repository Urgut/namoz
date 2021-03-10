import 'package:namazapp/core/data/datasources/gender.data.dart';
import 'package:namazapp/core/data/datasources/namaz-type-list.data.dart';
import 'package:namazapp/core/data/datasources/namaz-list.data.dart';
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

      // Customize niet part
      fajrTwoRakaatSunnaNamaz.parts[0].description =
          fajrTwoRakaatSunnaNamaz.parts[0].description.replaceAll(
              "{{niet}}", "Таң намазының екі рәкат сүннетін оқуға ниет еттім");

      // Paryz namazy
      BaseRakaats twoRakaatsParyz = TwoRakaats(gender: gender);

      Namaz fajrTwoRakaatParyzNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatParyz,
        rakaats: twoRakaatsParyz.rakaats,
        parts: twoRakaatsParyz.getParts(),
      );
      // Customize niet part
      fajrTwoRakaatParyzNamaz.parts[0].description =
          fajrTwoRakaatParyzNamaz.parts[0].description.replaceAll(
              "{{niet}}", "Таң намазының екі рәкат парызын оқуға ниет еттім");

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
      fajrTwoRakaatSunnaNamaz.parts[0].description =
          fajrTwoRakaatSunnaNamaz.parts[0].description.replaceAll("{{niet}}",
              "Бесін намазының төрт рәкат сүннетін оқуға ниет еттім");

      // Paryz namazy
      BaseRakaats fourRakaatsParyz = FourRakaats(gender: gender);

      Namaz fourRakaatParyzNamaz = Namaz(
        period: period,
        title: NamazTypeListData.fourRakaatParyz,
        rakaats: fourRakaatsParyz.rakaats,
        parts: fourRakaatsParyz.getParts(),
      );
      fourRakaatParyzNamaz.parts[0].description =
          fourRakaatParyzNamaz.parts[0].description.replaceAll("{{niet}}",
              "Бесін намазының төрт рәкат парызын оқуға ниет еттім");

      BaseRakaats twoRakaatsSunna = TwoRakaats(gender: gender);

      Namaz dhuhrTwoRakaatSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatSunna,
        rakaats: twoRakaatsSunna.rakaats,
        parts: twoRakaatsSunna.getParts(),
      );
      dhuhrTwoRakaatSunnaNamaz.parts[0].description =
          dhuhrTwoRakaatSunnaNamaz.parts[0].description.replaceAll("{{niet}}",
              "Бесін намазының екі рәкат сұннетін оқуға ниет еттім");

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
      asrNamaz.parts[0].description = asrNamaz.parts[0].description.replaceAll(
          "{{niet}}", "Аср намазының төрт рәкат парызын оқуға ниет еттім");

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
      magribParyzNamaz.parts[0].description =
          magribParyzNamaz.parts[0].description.replaceAll(
              "{{niet}}", "Ақшам намазының үш рәкат парызын оқуға ниет еттім");

      // 2 sunna
      BaseRakaats magribSunnaRakaats = TwoRakaats(gender: gender);

      Namaz magribSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatSunna,
        rakaats: magribSunnaRakaats.rakaats,
        parts: magribSunnaRakaats.getParts(),
      );
      magribSunnaNamaz.parts[0].description =
          magribSunnaNamaz.parts[0].description.replaceAll("{{niet}}",
              "Ақшам намазының екі рәкат сүннетін оқуға ниет еттім");

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
      ishaParyzNamaz.parts[0].description = ishaParyzNamaz.parts[0].description
          .replaceAll("{{niet}}",
              "Құптан намазының төрт рәкат парызын оқуға ниет еттім");

      BaseRakaats ishaSunnaRakaats = TwoRakaats(gender: gender);
      Namaz ishaSunnaNamaz = Namaz(
        period: period,
        title: NamazTypeListData.twoRakaatSunna,
        rakaats: ishaSunnaRakaats.rakaats,
        parts: ishaSunnaRakaats.getParts(),
      );
      ishaSunnaNamaz.parts[0].description = ishaSunnaNamaz.parts[0].description
          .replaceAll("{{niet}}",
              "Құптан намазының екі рәкат сүннетін оқуға ниет еттім");

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
      vitrNamaz.parts[0].description = vitrNamaz.parts[0].description
          .replaceAll(
              "{{niet}}", "Үтір намазының үш рәкат сүннетін оқуға ниет еттім");

      namazList.add(vitrNamaz);
    }

    return NamazWrapper(
      title: period,
      icon: "",
      namazList: namazList,
    );
  }
}
