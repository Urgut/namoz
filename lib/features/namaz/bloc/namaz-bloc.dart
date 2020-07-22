import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-events.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/models/namaz-wrapper.model.dart';
import 'package:namazapp/features/namaz/data/repositories/namaz.repository.dart';

class NamazBloc extends Bloc<NamazEvents, NamazState> {
  NamazRepository repos;

  // Dependecy
  NamazBloc({@required this.repos});

  @override
  NamazState get initialState => NamazLoading();

  @override
  Stream<NamazState> mapEventToState(NamazEvents event) async* {
    if (event is LoadNamazEvent) {
      // Notify: loading
      yield NamazLoading();

      // Get Data. No matter where get data) From network, local data or storage, depends on busunuess
      NamazWrapper data = await this.getData(
        period: event.period,
        gender: event.gender,
      );

      // Notify: Data come
      yield NamazLoaded(data);
    }
  }

  Future<NamazWrapper> getData({
    @required period,
    @required gender,
  }) {
    return this.repos.getData(
          period: period,
          gender: gender,
        );
  }
}
