import 'package:namazapp/features/namaz/data/parts/sitting/sitting-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/sitting/sitting-part.dart';
import 'package:namazapp/features/namaz/data/parts/sitting/sitting-woman-part.dart';

class PartSittinFactory {
  SittingPart create(String gender) {
    if (gender == 'man') {
      return SittingPartMan();
    }

    if (gender == 'woman') {
      return SittingPartWoman();
    }

    return null;
  }
}
