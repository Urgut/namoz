import 'package:namazapp/features/namaz/data/parts/attahiyat/attahiyat-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/attahiyat/attahiyat-part.dart';
import 'package:namazapp/features/namaz/data/parts/attahiyat/attahiyat-woman-part.dart';

class PartAttahiyatFactory {
  AttahiyatPart create(String gender) {
    if (gender == 'man') {
      return AttahiyatManPart();
    }

    if (gender == 'woman') {
      return AttahiyatWomanPart();
    }

    return null;
  }
}
