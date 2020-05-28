import 'package:flutter/material.dart';
import 'package:namazapp/core/helpers/future-helper.dart';
import 'package:namazapp/core/helpers/json-helper.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/data/repositories/namaz.repository.dart';

/*
  Get single namaz detail
*/
class NamazLocalDataRepository extends NamazRepository {
  static const String basePath = 'assets/data/json/namaz';

  /*
    Gender: man or woman
    NamazType: парыз или сунна
  */
  Future<BaseNamaz> getData({
    @required String gender,
    @required String namazTitle,
    @required String languageTag,
    @required String namazType,
    @required bool isSecondSunna,
  }) async {
    try {
      // Delay
      await FutureHelper.doDelay(seconds: 1);

      // Read file
      String subDir = '$gender/$namazTitle/$languageTag';
      String fileName = '$namazType.json';
      String fullPath = '$basePath/$subDir/$fileName';

      String response = await JsonHelper.readJsonFileAndReturnString(fullPath);

      // Convert string to json
      Map<String, dynamic> jsonData = JsonHelper.convertStringToJson(response);

      // Convert json to dart code

      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
