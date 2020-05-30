import 'package:namazapp/features/namaz/data/parts/takbir/takbir-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/takbir/takbir-part.dart';
import 'package:namazapp/features/namaz/data/parts/takbir/takbir-woman-part.dart';

class PartTakbirFactory {
  TakbirPart create(String gender) {
    if (gender == 'man') {
      return TakbirManPart();
    }

    if (gender == 'цщman') {
      return TakbirWomanPart();
    }

    return null;
  }
}
