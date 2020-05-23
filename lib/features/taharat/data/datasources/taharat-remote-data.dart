import 'package:namazapp/features/taharat/data/models/taharat-model.dart';
import 'package:namazapp/features/taharat/data/repositories/taharat-repository.dart';

/*
  Get data from remote server
*/
class TaharatRemoteDataRepository implements TaharatRepository {
  Future<List<TaharatModel>> getData() async {
    await Future.delayed(Duration(seconds: 1));
    List<TaharatModel> items = [];
    return items;
  }
}
