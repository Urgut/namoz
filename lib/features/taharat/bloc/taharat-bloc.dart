import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/taharat/bloc/taharat-events.dart';
import 'package:namazapp/features/taharat/bloc/taharat-state.dart';
import 'package:namazapp/features/taharat/data/datasources/taharat-local-data.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';
import 'package:namazapp/features/taharat/data/repositories/taharat-repository.dart';

class TaharatBloc extends Bloc<TaharatEvents, TaharatState> {
  TaharatRepository _repos;

  TaharatBloc() {
    this._repos =
        new TaharatRepository(dataProvider: TaharatLocalDataProvider());
  }

  @override
  TaharatState get initialState => TaharatLoading();

  @override
  Stream<TaharatState> mapEventToState(TaharatEvents event) async* {
    switch (event) {
      case TaharatEvents.loadTahartDetails:
        yield TaharatLoading();

        // Load Data
        List<TaharatModel> data = await this.getData();
        yield TaharatLoaded(data);

        break;
    }
  }

  Future<List<TaharatModel>> getData() {
    return this._repos.getData();
  }
}
