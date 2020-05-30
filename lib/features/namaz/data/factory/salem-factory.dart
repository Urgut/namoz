import 'package:namazapp/features/namaz/data/parts/salem/salem-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/salem/salem-part.dart';
import 'package:namazapp/features/namaz/data/parts/salem/salem-woman-part.dart';

class PartSalemFactory {
  SalemPart create(String gender) {
    if (gender == 'man') {
      return SalemManPart();
    }

    if (gender == 'woman') {
      return SalemWomanPart();
    }

    return null;
  }
}
