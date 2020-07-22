abstract class NamazEvents {}

class LoadNamazEvent extends NamazEvents {
  final String period;
  final String gender;

  LoadNamazEvent({
    this.period,
    this.gender,
  });
}
