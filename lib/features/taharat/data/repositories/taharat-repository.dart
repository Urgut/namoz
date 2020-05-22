import 'package:flutter/material.dart';
import 'package:namazapp/features/taharat/data/datasources/taharat-local-data.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';

class TaharatRepository {
  TaharatLocalDataProvider dataProvider;

  TaharatRepository({
    @required this.dataProvider,
  });

  Future<List<TaharatModel>> getData() async {
    return await dataProvider.getData();
  }
}
