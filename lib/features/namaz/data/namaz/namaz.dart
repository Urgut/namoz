import 'package:flutter/material.dart';
import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';
import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';

class Namaz implements BaseNamaz {
  // Fajr, dhuhr
  String period;
  // twoRakaat
  String title;  
  List<NamazRakaatModel> rakaats;
  // Необходимо для слайдера
  List<IPart> parts;

  Namaz({
    @required this.period,
    @required this.title,
    @required this.rakaats,
    @required this.parts,
  });
}
