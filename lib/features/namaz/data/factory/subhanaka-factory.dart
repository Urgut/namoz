import 'package:namazapp/features/namaz/data/parts/subhanaka/part-subhanaka-woman.dart';
import 'package:namazapp/features/namaz/data/parts/subhanaka/part-subhanaka-man.dart';
import 'package:namazapp/features/namaz/data/parts/subhanaka/part-subhanaka.dart';

class FactoryPartSubhanaka {
  PartSubhanaka create(String gender) {
    if (gender == 'man') {
      return PartSubhanakaMan();
    }

    if (gender == 'woman') {
      return PartSubhanakaWoman();
    }

    return null;
  }
}
