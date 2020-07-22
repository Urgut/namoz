import 'package:namazapp/features/namaz/data/parts/aguzu/aguzu-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/aguzu/aguzu-part.dart';
import 'package:namazapp/features/namaz/data/parts/aguzu/aguzu-woman-part.dart';

class PartAguzuBismillaFactory {
  AguzuPart create(String gender) {
    if (gender == 'man') {
      return AguzuManPart();
    }

    if (gender == 'woman') {
      return AguzuWomanPart();
    }

    return null;
  }
}
