import 'package:namazapp/features/namaz/data/parts/kiyam/kiyam-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/kiyam/kiyam-part.dart';
import 'package:namazapp/features/namaz/data/parts/kiyam/kiyam-woman-part.dart';

class PartKiyamFactory {
  KiyamSubhanakaPart create(String gender) {
    if (gender == 'man') {
      return KiyamSubhanakaManPart();
    }

    if (gender == 'woman') {
      return KiyamSubhanakaWomanPart();
    }

    return null;
  }
}
