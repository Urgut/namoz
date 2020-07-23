import 'package:namazapp/features/namaz/data/parts/sura_asr/part-sura-asr-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/sura_asr/part-sura-asr-part.dart';
import 'package:namazapp/features/namaz/data/parts/sura_asr/part-sura-asr-woman-part.dart';

class FactoryPartAsrFactory {
  PartSuraAsrPart create(String gender) {
    if (gender == 'man') {
      return SuraAsrManPart();
    }

    if (gender == 'woman') {
      return SuraAsrWomanPart();
    }

    return null;
  }
}
