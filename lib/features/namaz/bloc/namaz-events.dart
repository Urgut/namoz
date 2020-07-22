abstract class NamazEvents {}

class LoadNamazEvent extends NamazEvents {
  final String gender;
  final String namazTitle;

  LoadNamazEvent({
    this.gender,
    this.namazTitle,
  });
}
