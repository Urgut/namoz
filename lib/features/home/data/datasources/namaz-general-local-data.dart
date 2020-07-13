import 'package:flutter/material.dart';
import 'package:namazapp/features/home/data/models/namaz-general-model.dart';

class NamazGeneralLocalData {
  Future<List<NamazGeneralModel>> getData() async {
    List<NamazGeneralModel> result = [];

    result.add(NamazGeneralModel(title: 'tan', icon: Icon(Icons.list), namazs: [
      '2 rakaat sunna',
      '2 rakaat farz',
    ]));

    result.add(NamazGeneralModel(title: 'tan', icon: Icon(Icons.list), namazs: [
      '2 rakaat sunna',
      '2 rakaat farz',
    ]));

    result.add(NamazGeneralModel(title: 'tan', icon: Icon(Icons.list), namazs: [
      '2 rakaat sunna',
      '2 rakaat farz',
    ]));

    result.add(NamazGeneralModel(title: 'tan', icon: Icon(Icons.list), namazs: [
      '2 rakaat sunna',
      '2 rakaat farz',
    ]));

    result.add(NamazGeneralModel(title: 'tan', icon: Icon(Icons.list), namazs: [
      '2 rakaat sunna',
      '2 rakaat farz',
    ]));

    result.add(NamazGeneralModel(title: 'tan', icon: Icon(Icons.list), namazs: [
      '2 rakaat sunna',
      '2 rakaat farz',
    ]));
   

    return result;
  }
}
