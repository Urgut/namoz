import 'package:namazapp/features/namaz-list/data/models/namaz-group.model.dart';
import 'package:namazapp/features/namaz-list/data/models/namaz-short.model.dart';

class NamazListLocalDatasouce {
  List<NamazGroupModel> getData() {
    NamazGroupModel tanGroup = prepareTanNamaz();
    NamazGroupModel dhuhrGroup = prepareDhuhrNamaz();
    NamazGroupModel asrGroup = prepareAsrNamaz();
    NamazGroupModel magribGroup = prepareMagribNamaz();
    NamazGroupModel ishaGroup = prepareIshaNamaz();

    return [
      tanGroup,
      dhuhrGroup,
      asrGroup,
      magribGroup,
      ishaGroup,
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

  NamazGroupModel prepareAsrNamaz() {
    List<NamazShortModel> namazs = [];

    NamazShortModel paryz = NamazShortModel(
      title: 'asr',
      rakaatDesc: '4_rakaats_paryz',
      type: 'paryz',
    );

    namazs.add(paryz);

    NamazGroupModel group = NamazGroupModel(
      title: 'asr',
      description: '',
      namazs: namazs,
    );

    return group;
  }

  NamazGroupModel prepareMagribNamaz() {
    List<NamazShortModel> namazs = [];

    NamazShortModel paryz = NamazShortModel(
      title: 'magrib',
      rakaatDesc: '3_rakaats_paryz',
      type: 'paryz',
    );

    NamazShortModel sunna = NamazShortModel(
      title: 'magrib',
      rakaatDesc: '2_rakaats_sunna',
      type: 'sunna',
    );

    namazs.add(paryz);
    namazs.add(sunna);

    NamazGroupModel group = NamazGroupModel(
      title: 'magrib',
      description: '',
      namazs: namazs,
    );

    return group;
  }

  NamazGroupModel prepareIshaNamaz() {
    List<NamazShortModel> namazs = [];

    NamazShortModel paryz = NamazShortModel(
      title: 'isha',
      rakaatDesc: '4_rakaats_paryz',
      type: 'paryz',
    );

    NamazShortModel sunna = NamazShortModel(
      title: 'magrib',
      rakaatDesc: '2_rakaats_sunna',
      type: 'sunna',
    );

    namazs.add(paryz);
    namazs.add(sunna);

    NamazGroupModel group = NamazGroupModel(
      title: 'isha',
      description: '',
      namazs: namazs,
    );

    return group;
  }
}
