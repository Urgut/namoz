import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/constants/languages.dart';
import 'package:namazapp/features/taharat/bloc/taharat-events.dart';
import 'package:namazapp/features/taharat/bloc/taharat-state.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';
import 'package:namazapp/features/taharat/data/repositories/taharat-repository.dart';

class TaharatBloc extends Bloc<TaharatEvents, TaharatState> {
  TaharatRepository repos;

  // Dependecy
  TaharatBloc({@required this.repos});

  @override
  TaharatState get initialState => TaharatLoading();

  @override
  Stream<TaharatState> mapEventToState(TaharatEvents event) async* {
    switch (event) {
      case TaharatEvents.loadTahartDetails:
        // Notify: loading
        yield TaharatLoading();

        // Get Data. No matter where get data) From network, local data or storage, depends on busunuess
        List<TaharatModel> data = await this.getData();

        // Notify: Data come
        yield TaharatLoaded(data);
        break;
    }
  }

  Future<List<TaharatModel>> getData() {
    return this.repos.getData(languageTag: AppLanguages.defaultLanguage);
  }
}
