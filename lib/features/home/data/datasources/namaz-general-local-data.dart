import 'package:namazapp/features/home/data/models/namaz-general-model.dart';
import 'package:namazapp/shared/fonts/namaz_fonts.dart';

class NamazGeneralLocalData {
  Future<List<NamazGeneralModel>> getData() async {
    List<NamazGeneralModel> result = [];

    result.add(
      NamazGeneralModel(
        title: 'fajr',
        icon: NamazIcons.fajr,
        namazs: [
          '2_rakaats_sunna',
          '2_rakaats_paryz',
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: 'dhuhr',
        icon: NamazIcons.dhuhr,
        namazs: [
          '4_rakaats_sunna',
          '4_rakaats_paryz',
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: 'asr',
        icon: NamazIcons.asr,
        namazs: [
          '4_rakaats_paryz',
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: 'magrib',
        icon: NamazIcons.magrib,
        namazs: [
          '3_rakaats_paryz',
          '2_rakaats_sunna',
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: 'isha',
        icon: NamazIcons.isha,
        namazs: [
          '4_rakaats_sunna',
          '2_rakaats_paryz',
        ],
      ),
    );

    result.add(
      NamazGeneralModel(
        title: 'vitr',
        icon: NamazIcons.isha,
        namazs: [
          '3_rakaats_vitr',
        ],
      ),
    );

    return result;
  }
}
