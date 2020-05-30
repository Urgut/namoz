import 'package:flutter/material.dart';
import 'package:namazapp/core/helpers/future-helper.dart';
import 'package:namazapp/features/namaz/data/factory/namaz-factory.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/data/repositories/namaz.repository.dart';

/*
  Get single namaz detail
*/
class NamazOOPDataRepository extends NamazRepository {
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
      await FutureHelper.doDelay(seconds: 0);

      // Factory: Create objects based on params
      dynamic instance = NamazFactory().getNamaz(
        gender: gender,
        namazName: namazTitle,
        namazType: namazType,
        isSecondSunnet: isSecondSunna,
      );
      return instance;
    } catch (e) {
      throw Exception(e);
    }
  }
}
