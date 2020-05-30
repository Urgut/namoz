import 'package:namazapp/features/namaz/data/parts/rukuh_go/rukuh-go-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/rukuh_go/rukuh-go-part.dart';
import 'package:namazapp/features/namaz/data/parts/rukuh_go/rukuh-go-woman-part.dart';

class PartRukuhGoFactory {
  RukuhGoPart create(String gender) {
    if (gender == 'man') {
      return RukuhGoManPart();
    }

    if (gender == 'woman') {
      return RukuhGoWomanPart();
    }

    return null;
  }
}
