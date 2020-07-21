import 'package:namazapp/features/namaz/data/parts/rabbana_atina/rabbana_atina-man.part.dart';
import 'package:namazapp/features/namaz/data/parts/rabbana_atina/rabbana_atina-woman.part.dart';
import 'package:namazapp/features/namaz/data/parts/rabbana_atina/rabbana_atina.part.dart';

class PartRabbanaAtinaFactory {
  RabbanaAtinaPart create(String gender) {
    if (gender == 'man') {
      return RabbanaAtinaManPart();
    }

    if (gender == 'woman') {
      return RabbanaAtinaWomanPart();
    }

    return null;
  }
}
