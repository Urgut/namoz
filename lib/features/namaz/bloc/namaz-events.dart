abstract class NamazEvents {}

class LoadNamazEvent extends NamazEvents {
  final String gender;
  final String namazTitle;
  final String namazType;
  final bool isSecondSunna;

  LoadNamazEvent({
    this.gender,
    this.namazTitle,
    this.namazType,
    this.isSecondSunna,
  });
}
