import 'package:namazapp/features/namaz/data/parts/kunut/kunut-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/kunut/kunut-part.dart';
import 'package:namazapp/features/namaz/data/parts/kunut/kunut-woman-part.dart';

class PartKunutFactory {
  KunutPart create(String gender) {
    if (gender == 'man') {
      return KunutManPart();
    }

    if (gender == 'woman') {
      return KunutWomanPart();
    }

    return null;
  }
}
