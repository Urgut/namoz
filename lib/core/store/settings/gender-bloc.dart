import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/store/settings/gender-events.dart';
import 'package:namazapp/core/store/settings/gender-state.dart';

class GenderBloc extends Bloc<GenderEvents, GenderState> {
  @override
  GenderState get initialState => UpdatedGenderState('man');

  @override
  Stream<GenderState> mapEventToState(GenderEvents event) async* {
    if (event is UpdateGenderEvent) {
      // Notify: Data come
      yield UpdatedGenderState(event.gender);
    }
  }
}
