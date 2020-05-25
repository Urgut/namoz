import 'package:flutter/material.dart';
import 'package:namazapp/features/namaz/data/models/namaz-model.dart';

abstract class NamazRepository {
  Future<NamazModel> getData({
    @required String gender,
    @required String namazTitle,
    @required String languageTag,
    @required String namazType,
  });
}
