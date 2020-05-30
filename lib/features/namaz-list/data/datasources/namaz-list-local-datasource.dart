import 'package:namazapp/features/namaz-list/data/models/namaz-group.model.dart';
import 'package:namazapp/features/namaz-list/data/models/namaz-short.model.dart';

class NamazListLocalDatasouce {
  List<NamazGroupModel> getData() {
    NamazGroupModel tanGroup = prepareTanNamaz();
    NamazGroupModel dhuhrGroup = prepareDhuhrNamaz();

    return [
      tanGroup,
      dhuhrGroup,
    ];
  }

  NamazGroupModel prepareTanNamaz() {
    List<NamazShortModel> tanNamazs = [];

    NamazShortModel sunna = NamazShortModel(
      title: 'fajr',
      rakaatDesc: '2_rakaats_sunna',
      type: 'sunna',
    );

    NamazShortModel paryz = NamazShortModel(
      title: 'fajr',
      rakaatDesc: '2_rakaats_paryz',
      type: 'paryz',
    );

    tanNamazs.add(sunna);
    tanNamazs.add(paryz);

    NamazGroupModel tan = NamazGroupModel(
      title: 'fajr',
      description: '',
      namazs: tanNamazs,
    );

    return tan;
  }

  NamazGroupModel prepareDhuhrNamaz() {
    List<NamazShortModel> namazs = [];

    NamazShortModel sunna = NamazShortModel(
      title: 'dhuhr',
      rakaatDesc: '4_rakaats_sunna',
      type: 'sunna',
    );

    NamazShortModel paryz = NamazShortModel(
      title: 'dhuhr',
      rakaatDesc: '4_rakaats_paryz',
      type: 'paryz',
    );

    NamazShortModel sunnaSecond = NamazShortModel(
      title: 'dhuhr',
      rakaatDesc: '2_rakaats_sunna',
      type: 'sunna_second',
    );

    namazs.add(sunna);
    namazs.add(paryz);
    namazs.add(sunnaSecond);

    NamazGroupModel group = NamazGroupModel(
      title: 'dhuhr',
      description: '',
      namazs: namazs,
    );

    return group;
  }
}
