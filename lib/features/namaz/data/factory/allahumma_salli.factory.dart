import 'package:namazapp/features/namaz/data/parts/allahumma_salli/allahumma_salli-man-part.dart';
import 'package:namazapp/features/namaz/data/parts/allahumma_salli/allahumma_salli-part.dart';
import 'package:namazapp/features/namaz/data/parts/allahumma_salli/allahumma_salli-woman-part.dart';

class PartAllhummaSalliFactory {
  PartAllahummaSalliPart create(String gender) {
    if (gender == 'man') {
      return PartAllahummaSalliManPart();
    }

    if (gender == 'woman') {
      return PartAllahummaSalliWomanPart();
    }

    return null;
  }
}
