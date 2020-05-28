import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/data/namaz/fajr/farj-paryz.dart';
import 'package:namazapp/features/namaz/data/namaz/fajr/farj-sunna.dart';

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
      switch (namazType) {
        case 'sunna':
          return FajrSunnaNamaz(gender: gender);
          break;
        case 'paryz':
          return FajrParyzNamaz(gender: gender);
          break;
      }
    }

    return null;
  }
}
