import 'package:flutter/material.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';

class NamazWrapper {
  final String title;
  final String icon;
  final List<Namaz> namazList;

  NamazWrapper({
    @required this.title,
    @required this.icon,
    @required this.namazList,
  });
}
