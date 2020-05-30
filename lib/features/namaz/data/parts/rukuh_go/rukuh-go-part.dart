import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';

class RukuhGoPart implements IPart {
  String title = 'Рукуғқа бару';
  String description = 'Қиямнан рукуғқа бара жатып «Аллаһу Акбар» дейді (имам жамағаттың еститініндей дауыстайды). Рукуғқа тұрғанда: «Субхана Раббиял-‘Азим» деп 3 рет іштей айтады';
  String image = '';
  List<String> audio = [
    'rukuh.mp3'
  ];
  String transcript = '<p>Субхана Раббиял-&lsquo;Азим</p><p>Субхана Раббиял-&lsquo;Азим</p><p>Субхана Раббиял-&lsquo;Азим</p>';
  String translation = "<p>&laquo;Аса ұлы Раббым күллі кемістік атаулыдан пәк&raquo;</p><p>&laquo;Аса ұлы Раббым күллі кемістік атаулыдан пәк&raquo;</p><p>&laquo;Аса ұлы Раббым күллі кемістік атаулыдан пәк&raquo;</p>";
  String arabic = "<p>سبحان ربي العظيم</p><p>سبحان ربي العظيم</p><p>سبحان ربي العظيم</p>";
}
