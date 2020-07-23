import 'package:namazapp/features/namaz/data/parts/sura_fatiha/part-sura-fatiha-man.dart';
import 'package:namazapp/features/namaz/data/parts/sura_fatiha/part-sura-fatiha-woman.dart';
import 'package:namazapp/features/namaz/data/parts/sura_fatiha/part-sura-fatiha.dart';

class FatihaPartFactory {
  PartSuraFatiha create(String gender) {
    if (gender == 'man') {
      return PartSuraFatihaMan();
    }

    if (gender == 'woman') {
      return PartSuraFatihaWoman();
    }

    return null;
  }
}
