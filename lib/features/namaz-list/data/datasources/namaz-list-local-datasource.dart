import 'package:namazapp/features/namaz-list/data/models/namaz-group.model.dart';
import 'package:namazapp/features/namaz-list/data/models/namaz-short.model.dart';

class NamazListLocalDatasouce {
  List<NamazGroupModel> getData() {
    NamazGroupModel tanGroup = prepareTanNamaz();

    return [
      tanGroup,
    ];
  }

  NamazGroupModel prepareTanNamaz() {
    List<NamazShortModel> tanNamazs = [];

    NamazShortModel sunna = NamazShortModel(
      title: 'sunna',
      route: 'tan-sunna',
    );

    NamazShortModel paryz = NamazShortModel(
      title: 'paryz',
      route: 'tan-paryz',
    );

    tanNamazs.add(sunna);
    tanNamazs.add(paryz);

    NamazGroupModel tan = NamazGroupModel(
      title: 'Таң намазы',
      description: '',
      namazs: tanNamazs,
    );

    return tan;
  }
}
