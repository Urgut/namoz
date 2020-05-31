import 'package:flutter/material.dart';
import 'package:namazapp/core/services/future.service.dart';
import 'package:namazapp/features/namaz/data/factory/namaz-factory.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
import 'package:namazapp/features/namaz/data/namaz/namaz.dart';
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
      await FutureService.doDelay(seconds: 0);

      // Factory: Create objects based on params
      Namaz instance = NamazFactory().getNamaz(
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
