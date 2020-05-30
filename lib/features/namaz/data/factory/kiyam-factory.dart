import 'package:namazapp/features/namaz/data/parts/kiyam/kiyam-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/kiyam/kiyam-part.dart';
import 'package:namazapp/features/namaz/data/parts/kiyam/kiyam-woman-part.dart';

class PartKiyamFactory {
  KiyamPart create(String gender) {
    if (gender == 'man') {
      return KiyamManPart();
    }

    if (gender == 'woman') {
      return KiyamWomanPart();
    }

    return null;
  }
}
