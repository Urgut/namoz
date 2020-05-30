import 'package:namazapp/features/namaz/data/parts/fatiha_asr/fatiha-asr-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/fatiha_asr/fatiha-asr-part.dart';
import 'package:namazapp/features/namaz/data/parts/fatiha_asr/fatiha-asr-woman-part.dart';

class PartKiyamFatihaAsrFactory {
  FatihaAsrPart create(String gender) {
    if (gender == 'man') {
      return FatihaAsrManPart();
    }

    if (gender == 'woman') {
      return FatihaAsrWomanPart();
    }

    return null;
  }
}
