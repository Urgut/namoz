import 'package:namazapp/features/taharat/data/models/taharat-model.dart';
import 'package:namazapp/features/taharat/data/repositories/taharat-repository.dart';

/*
  Get data from code
*/
class TaharatLocalDataRepository implements TaharatRepository {
  Future<List<TaharatModel>> getData() async {
    await Future.delayed(Duration(seconds: 1));

    List<TaharatModel> items = [];

    TaharatModel general = TaharatModel(
      title: 'Дәрет алу',
      description:
          'Дәрет – Ислам дінінде кей ғибадаттарды орындау үшін арнайыжасалатын тазалық түрі. Дәрет үшін ғұсыл болуы керек. Ғұсылсыз дәрет жарамсыз.',
    );

    TaharatModel tx2 = TaharatModel(
      title: 'Дәреттің парыздары:',
      description: 'Бетті жуу. Екі қолды шынтаққа шейін жуу',
    );

    items.add(general);
    items.add(tx2);

    return items;
  }
}
