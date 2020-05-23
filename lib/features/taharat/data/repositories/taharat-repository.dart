import 'package:flutter/material.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';

abstract class TaharatRepository {
  Future<List<TaharatModel>> getData({@required String languageTag});
}
