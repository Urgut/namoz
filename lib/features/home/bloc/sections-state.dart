abstract class SectionsState {}

class SectionsLoading extends SectionsState {}

class SectionsLoaded extends SectionsState {
  final data;
  SectionsLoaded(this.data);
}

class SectionsFailure extends SectionsState {
  final String error;
  SectionsFailure(this.error);
}
