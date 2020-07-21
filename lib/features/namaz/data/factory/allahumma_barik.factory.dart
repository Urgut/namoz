import 'package:namazapp/features/namaz/data/parts/allahnumma_barik/allahumma_barik-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/allahnumma_barik/allahumma_barik-part.dart';
import 'package:namazapp/features/namaz/data/parts/allahnumma_barik/allahumma_barik-woman-part.dart';

class PartAllhummaBarikFactory {
  AllahummaBarikPart create(String gender) {
    if (gender == 'man') {
      return AllahummaBarikManPart();
    }

    if (gender == 'woman') {
      return AllahummaBarikWomanPart();
    }

    return null;
  }
}
