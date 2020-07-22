import 'package:flutter/material.dart';
import 'package:namazapp/features/namaz/data/models/namaz-wrapper.model.dart';

abstract class NamazRepository {
  Future<NamazWrapper> getData({
    @required String namazTitle,
    @required String gender,
  });
}
