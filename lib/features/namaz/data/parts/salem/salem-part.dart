import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';

class SalemPart implements IPart {
  String title = 'Сәлем беру';
  String description = "<p>Оң жағына басын бұрып &laquo;Әс-сәләму &rsquo;аләйкум уа рахматуллаһ&raquo; деп сәлем береді;</p><p>Сосын сол жағына қарап &laquo;Әс-сәләму &rsquo;аләйкум уа рахматуллаһ&raquo; деп</p>";
  String image = '';
  List<String> audio = [];
  String transcript = "<p>Әс-сәләму &rsquo;аләйкум уа рахматуллаһ</p><p>Әс-сәләму &rsquo;аләйкум уа рахматуллаһ</p>";
  String translation = "«Сендерге Алланың сәлемі мен мейірімі жаусын. «Сендерге Алланың сәлемі мен мейірімі жаусын.";
  String arabic = "<p>السلام عليكم ورحمة الله</p><p>السلام عليكم ورحمة الله</p>";
}
