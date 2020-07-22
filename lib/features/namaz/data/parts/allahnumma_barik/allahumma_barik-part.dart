import 'package:namazapp/features/namaz/data/interfaces/part-iterface.dart';

class AllahummaBarikPart implements IPart {
  String title = 'Аллахумма бәрик';
  String description = "<p>Салауат дұғалары.</p>";
  String image = '';
  List<String> audio = [
    "barik.mp3",
  ];
  String transcript =
      "Аллаһумма бәрик &rsquo;ала Мухаммәдин уә,&rsquo;ала<br />әли Мухаммәд. Кәмә бәрәктә &rsquo;ала Ибраһим, уә &rsquo;ала әли Ибраһим. Иннәкә хамидун мәжид</p><p>Раббәнә атина фид-дунья хасәнә,<br />уа фил-ахирати хасәнә,<br />уа қина &rsquo;азабан-нәр</p></div>";
  String translation =
      "<p>&laquo;Я, Аллам! Пайғамбарымыз (с.а.у.) Мұхаммедке және Оның отбасы мен ұрпағына, мейіріміңді төгіп, олардың мерейін үстем ет. Тура хазіреті Ибраһим және оның отбасы мен ұрпағына мейіріміңді төгіп, олардың мерейін үстем еткеніңдей. Және Хазіреті Мұхаммед пен оның отбасын, ұрпағын мүбәрак ет. Олардың ырыс-берекетін ұдайы арттыр. Тура Хазіреті Ибраһим оның отбасын, ұрпағын мүбәрак еткенің секілді. Күмәнсіз Сен &ndash; Хамидсің, мәжидсің. Яғни, барлық мадақ пен ұлылық, асқақтық саған ғана тән&raquo;.</p>";
  String arabic =
      "<p>اللهم صل على محمد وعلى آل محمد<br />كما صليت على إبراهيم وعلى آل إبراهيم.<br />وبارك على محمد وعلى آل محمد<br />كما باركت على إبراهيم وعلى آل إبراهيم،<br />في العالمين إنك حميد مجيد</p>";
  String rakaatName = "";
}
