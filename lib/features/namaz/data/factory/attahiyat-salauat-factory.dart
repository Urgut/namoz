import 'package:namazapp/features/namaz/data/parts/attahiyat-salauat/attahiyat-salauat-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/attahiyat-salauat/attahiyat-salauat-part.dart';
import 'package:namazapp/features/namaz/data/parts/attahiyat-salauat/attahiyat-salauat-woman-part.dart';

class PartAttahiyatSalauatFactory {
  AttahiyatSalauatPart create(String gender) {
    if (gender == 'man') {
      return AttahiyatSalauatManPart();
    }

    if (gender == 'woman') {
      return AttahiyatSalauatWomanPart();
    }

    return null;
  }
}
