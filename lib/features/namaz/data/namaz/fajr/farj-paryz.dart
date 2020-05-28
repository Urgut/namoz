import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/data/parts/niet/niet-man-part.dart';

class FajrParyzNamaz implements BaseNamaz {
  String title = 'Таң намазы';

  @override
  String mode = '2 рәкәт сүннет';

  @override
  String gender = 'man';

  @override
  List<NamazRakaatModel> rakaats;

  FajrParyzNamaz({this.gender = 'man'}) {
    // Generate rakaats
    NamazRakaatModel r1 = NamazRakaatModel(
      title: '1 рәкәт',
      parts: [
        NietManPart(),
      ],
    );

    this.rakaats = [
      r1,
    ];
  }
}
