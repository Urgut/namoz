import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';

class PartSuraAsrPart implements IPart {
  String title = 'Қосымша сүре(Аср сүресі)';
  String description =
      'Құраннан бір сүре немесе ең азы үш аят оқылады. Мысалға Аср сүресі алынды.';
  String image = '';
  String audio = "asr.mp3";
  String transcript = 'Уәл-&lsquo;аср <br/>' +
      'иннәл-инсәнә ләфии хуср<br />' +
      'илләл-ләз̃иинә әмәнуу уә&lsquo;амилуус-салихәти уәтәуәсау бил-хаққи уәтәуәсау бис-сабр.';
  String translation = 'Заманға серт. <br/>' +
      'Негізінен адам баласы зиянда. <br/>' +
      'Бірақ сондай иман келтіріп, ізгі іс істегендер, бір-біріне шындықты үгіттесіп, сабырды үгіттескендер; олар зиянға ұшырамайды.</br>';
  String arabic =
      "<p>وَالْعَصْرِ<br />إِنَّ الْإِنسَانَ لَفِي خُسْرٍ<br />إِلَّا الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَتَوَاصَوْا بِالْحَقِّ وَتَوَاصَوْا بِالصَّبْرِ</p>";
  String rakaatName = "";
  String comment = "";
}
