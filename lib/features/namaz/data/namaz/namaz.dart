import 'package:flutter/material.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';

class Namaz implements BaseNamaz {
  String title;
  List<NamazRakaatModel> rakaats;
  List<IPart> parts;

  Namaz({
    @required this.title,
    @required this.rakaats,
    this.parts,
  });
}
