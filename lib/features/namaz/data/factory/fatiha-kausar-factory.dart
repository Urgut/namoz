import 'package:namazapp/features/namaz/data/parts/fatiha_kausar/fatiha-kausar-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/fatiha_kausar/fatiha-kausar-part.dart';
import 'package:namazapp/features/namaz/data/parts/fatiha_kausar/fatiha-kausar-woman-part.dart';

class PartFatihaKausarFactory {
  FatihaKausarPart create(String gender) {
    if (gender == 'man') {
      return FatihaKausarManPart();
    }

    if (gender == 'woman') {
      return FatihaKausarWomanPart();
    }

    return null;
  }
}
