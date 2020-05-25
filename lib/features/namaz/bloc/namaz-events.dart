abstract class NamazEvents {}

class LoadNamazEvent extends NamazEvents {
  final String gender;
  final String namazTitle;
  final String namazType;

  LoadNamazEvent({
    this.gender,
    this.namazTitle,
    this.namazType,
  });
}
