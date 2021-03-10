import 'package:namazapp/core/data/datasources/namaz-list.data.dart';
import 'package:namazapp/core/data/datasources/namaz-type-list.data.dart';
import 'package:namazapp/features/home/data/models/namaz-general-model.dart';
import 'package:namazapp/shared/fonts/namaz_fonts.dart';

class NamazGeneralLocalData {
  Future<List<NamazGeneralModel>> getData() async {
    List<NamazGeneralModel> result = [];

    result.add(
      NamazGeneralModel(
        title: NamazListData.fajr,
        icon: NamazIcons.fajr,
        namazs: [
          NamazTypeListData.twoRakaatSunna,
          NamazTypeListData.twoRakaatParyz,
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: NamazListData.dhuhr,
        icon: NamazIcons.dhuhr,
        namazs: [
          NamazTypeListData.fourRakaatSunna,
          NamazTypeListData.fourRakaatParyz,
          NamazTypeListData.twoRakaatSunna
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: NamazListData.asr,
        icon: NamazIcons.asr,
        namazs: [
          NamazTypeListData.fourRakaatParyz,
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: NamazListData.magrib,
        icon: NamazIcons.magrib,
        namazs: [
          NamazTypeListData.threeRakaatParyz,
          NamazTypeListData.twoRakaatSunna,
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: NamazListData.isha,
        icon: NamazIcons.isha,
        namazs: [
          NamazTypeListData.fourRakaatParyz,
          NamazTypeListData.twoRakaatSunna,
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: NamazListData.vitr,
        icon: NamazIcons.isha,
        namazs: [
          NamazTypeListData.threeRakaatVitr,
        ],
      ),
    );

    return result;
  }
}
