import 'package:namazapp/features/namaz/data/parts/sajde_second_last/sajde-second-last-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/sajde_second_last/sajde-second-last-part.dart';
import 'package:namazapp/features/namaz/data/parts/sajde_second_last/sajde-second-last-woman-part.dart';

class PartSajdeSecondLastFactory {
  SajdeSecondLastPart create(String gender) {
    if (gender == 'man') {
      return SajdeSecondLastManPart();
    }

    if (gender == 'woman') {
      return SajdeSecondLastWomanPart();
    }

    return null;
  }
}
