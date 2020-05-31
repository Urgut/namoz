import 'package:flutter/material.dart';
import 'package:namazapp/core/services/future.service.dart';
import 'package:namazapp/core/services/json.service.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';
import 'package:namazapp/features/taharat/data/repositories/taharat-repository.dart';

/*
  Get dart code from json file
*/
class TaharatLocalDataRepository implements TaharatRepository {
  static const String path = 'assets/data/json/taharat';

  Future<List<TaharatModel>> getData({@required String languageTag}) async {
    try {
      List<TaharatModel> items = [];

      // Delay
      await Future.delayed(Duration(microseconds: 500));

      // Read file
      String fileName = 'taharat_$languageTag.json';
      String jsonFile = '$path/$fileName';

      String response = await JsonService.readJsonFileAndReturnString(jsonFile);

      // Convert string to json
      Map<String, dynamic> jsonData = JsonService.convertStringToJson(response);

      // Convert json to dart code
      for (dynamic i in jsonData['result']) {
        items.add(TaharatModel.fromJson(i));
      }

      return items;
    } catch (e) {
      throw Exception(e);
    }
  }
}
