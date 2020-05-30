import 'package:namazapp/features/namaz/data/parts/fatiha/fatiha-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/fatiha/fatiha-part.dart';
import 'package:namazapp/features/namaz/data/parts/fatiha/fatiha-woman-part.dart';

class PartFatihaFactory {
  FatihaPart create(String gender) {
    if (gender == 'man') {
      return FatihaManPart();
    }

    if (gender == 'woman') {
      return FatihaWomanPart();
    }

    return null;
  }
}
