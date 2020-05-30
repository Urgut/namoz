import 'package:namazapp/features/namaz/data/parts/rukuh_back/rukuh-back-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/rukuh_back/rukuh-back-part.dart';
import 'package:namazapp/features/namaz/data/parts/rukuh_back/rukuh-back-woman-part.dart';

class PartRukuhBackFactory {
  RukuhBackPart create(String gender) {
    if (gender == 'man') {
      return RukuhBackManPart();
    }

    if (gender == 'woman') {
      return RukuhBackWomanPart();
    }

    return null;
  }
}
