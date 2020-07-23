import 'package:namazapp/features/namaz/data/parts/sura_kausar/part-sura-kausar-man.dart';
import 'package:namazapp/features/namaz/data/parts/sura_kausar/part-sura-kausar-woman.dart';
import 'package:namazapp/features/namaz/data/parts/sura_kausar/part-sura-kausar.dart';

class PartFatihaKausarFactory {
  PartSuraKausar create(String gender) {
    if (gender == 'man') {
      return PartSuraKausarMan();
    }

    if (gender == 'woman') {
      return PartSuraKausarWoman();
    }

    return null;
  }
}
