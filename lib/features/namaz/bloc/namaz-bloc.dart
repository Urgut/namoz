import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/constants/languages.dart';
import 'package:namazapp/features/namaz/bloc/namaz-events.dart';
import 'package:namazapp/features/namaz/bloc/namaz-state.dart';
import 'package:namazapp/features/namaz/data/namaz/base-namaz.dart';
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
      BaseNamaz data = await this.getData(
        gender: event.gender,
        namazTitle: event.namazTitle,
        namazType: event.namazType,
      );

      // Notify: Data come
      yield NamazLoaded(data);
    }
  }

  Future<BaseNamaz> getData({
    @required gender,
    @required namazTitle,
    @required namazType,
  }) {
    return this.repos.getData(
          languageTag: AppLanguages.defaultLanguage,
          gender: gender,
          namazTitle: namazTitle,
          namazType: namazType,
        );
  }
}
