import 'package:namazapp/features/namaz/data/parts/sajde_second/sajde-second-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/sajde_second/sajde-second-part.dart';
import 'package:namazapp/features/namaz/data/parts/sajde_second/sajde-second-woman-part.dart';

class PartSajdeSecondFactory {
  SajdeSecondPart create(String gender) {
    if (gender == 'man') {
      return SajdeSecondManPart();
    }

    if (gender == 'woman') {
      return SajdeSecondWomanPart();
    }

    return null;
  }
}
