import 'package:flutter/material.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';

abstract class NamazRepository {
  Future<BaseNamaz> getData({
    @required String gender,
    @required String namazTitle,
    @required String languageTag,
    @required String namazType,
  });
}
