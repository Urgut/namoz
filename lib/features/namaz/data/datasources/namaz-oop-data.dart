import 'package:flutter/material.dart';
import 'package:namazapp/core/services/future.service.dart';
import 'package:namazapp/features/namaz/data/factory/namaz-factory.dart';
import 'package:namazapp/features/namaz/data/models/namaz-wrapper.model.dart';
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
  Future<NamazWrapper> getData({
    @required String period,
    @required String gender,
  }) async {
    try {
      // Delay
      await FutureService.doDelay(seconds: 0);

      // Factory: Create objects based on params
      NamazWrapper instance = NamazFactory().getNamaz(
        period: period,
        gender: gender,
      );
      return instance;
    } catch (e) {
      throw Exception(e);
    }
  }
}
