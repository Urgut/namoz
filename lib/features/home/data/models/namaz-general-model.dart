import 'package:flutter/material.dart';

class NamazGeneralModel {
  final String title;
  final IconData icon;
  final List<String> namazs;
  final String defaultNamazTitle;

  NamazGeneralModel({
    this.title,
    this.icon,
    this.namazs,
    this.defaultNamazTitle,
  });
}
