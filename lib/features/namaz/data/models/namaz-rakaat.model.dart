import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';

class NamazRakaatModel {
  final String title;
  final List<IPart> parts;
  final bool isRakaat;

  NamazRakaatModel({
    this.title,
    this.parts,
    this.isRakaat,
  });  
}
