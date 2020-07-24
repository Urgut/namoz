import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

class RakaatHelper {
  List<NamazRakaatModel> rakaats;

  RakaatHelper(this.rakaats);

  getParts() {
    List<IPart> parts = [];

    if (this.rakaats != null) {
      // Change rakaatName
      this.rakaats.map((NamazRakaatModel r) {
        String rakaatTitle = r.title;

        print('RR: $rakaatTitle');

        r.parts.map((p) {
          p.rakaatName = rakaatTitle;
          return p;
        }).toList();

        return r;
      }).toList();

      // Combine all namaz's parts in one list
      for (int i = 0; i < this.rakaats.length; i++) {
        parts.addAll(this.rakaats[i].parts);
      }
    }

    return parts;
  }
}
