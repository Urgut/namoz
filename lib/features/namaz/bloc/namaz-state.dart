abstract class NamazState {}

class NamazLoading extends NamazState {}

class NamazLoaded extends NamazState {
  final data;
  NamazLoaded(this.data);
}

class NamazFailure extends NamazState {
  final String error;
  NamazFailure(this.error);
}
