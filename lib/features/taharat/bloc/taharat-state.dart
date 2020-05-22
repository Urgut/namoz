abstract class TaharatState {}

class TaharatLoading extends TaharatState {}

class TaharatLoaded extends TaharatState {
  final data;
  TaharatLoaded(this.data);
}

class TaharatFailure extends TaharatState {
  final String error;
  TaharatFailure(this.error);
}
