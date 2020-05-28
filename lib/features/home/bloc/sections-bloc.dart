import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/features/home/bloc/sections-events.dart';
import 'package:namazapp/features/home/bloc/sections-state.dart';
import 'package:namazapp/features/home/data/datasources/sections-local-data.dart';
import 'package:namazapp/features/home/data/models/section.model.dart';

class SectionsBloc extends Bloc<SectionsEvents, SectionsState> {
  SectionLocalData localData;

  // Dependency
  SectionsBloc() {
    this.localData = new SectionLocalData();
  }

  @override
  SectionsState get initialState => SectionsLoading();

  @override
  Stream<SectionsState> mapEventToState(SectionsEvents event) async* {
    if (event is LoadSectionsEvent) {
      // Notify: loading
      yield SectionsLoading();

      // Get Data. No matter where get data) From network, local data or storage, depends on busunuess
      List<SectionModel> data = await this.getData();

      // Notify: Data come
      yield SectionsLoaded(data);
    }
  }

  Future<List<SectionModel>> getData() {
    return this.localData.getData();
  }
}
