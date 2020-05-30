import 'package:namazapp/features/namaz/data/parts/sajde_first/sajde-first-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/sajde_first/sajde-first-part.dart';
import 'package:namazapp/features/namaz/data/parts/sajde_first/sajde-first-woman-part.dart';

class PartSajdeFirstFactory {
  SajdeFirstPart create(String gender) {
    if (gender == 'man') {
      return SajdeFirstManPart();
    }

    if (gender == 'woman') {
      return SajdeFirstWomanPart();
    }

    return null;
  }
}
