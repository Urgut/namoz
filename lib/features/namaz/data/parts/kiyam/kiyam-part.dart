import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';

class KiyamSubhanakaPart implements IPart {
  String title = 'Субханәкә';
  String description = '';
  String image = '';
  List<String> audio = [
    'subhanaka.mp3'
  ];
  String transcript = '<p>Субханәкә Аллаһумма уа бихамдика<br />уа тәбәракасмук<br />уа та&lsquo;ала жәддук<br />уә лә иләһә ғайрук</p><p>Ә&lsquo;узу билләһи минәш-шәйтанир-ражим</p><p>Бисмлләһир-Рахманир-Рахим</p>';
  String translation = "<p>&laquo;Я, Аллам! Сені тәсбих етіп (күллі жаратылыс пен нұқсан атаулыдан) пәктеймін. Саған &laquo;хамд&raquo; айтып, мадақтаймын. Сенің қасиетті есімің аса мүбәрак. Және де сенің ұлылығың аса жоғары. Сенен басқа ешбір құдай жоқ&raquo;.</p>";
  String arabic = "<p>سبحانك اللهم وبحمدك وتبارك اسمك وتعالى جدك ولا<br />إله غيرك<br />أعوذ بالله من الشيطان الرجيم<br />بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ</p>";
}
