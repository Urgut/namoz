import 'package:namazapp/features/namaz/data/parts/niet/niet-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/niet/niet-part.dart';
import 'package:namazapp/features/namaz/data/parts/niet/niet-woman-part.dart';

class PartNietFactory {
  NietPart create(String gender) {
    if (gender == 'man') {
      return NietManPart();
    }

    if (gender == 'цщman') {
      return NietWomanPart();
    }

    return null;
  }
}
