import 'package:flutter_test/flutter_test.dart';
import 'package:namazapp/features/taharat/data/datasources/taharat-local-data.dart';
import 'package:namazapp/features/taharat/data/models/taharat-model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TaharatJsonData(kk)', () {
    test('taharat_kk.json', () async {
      List<TaharatModel> data =
          await TaharatLocalDataRepository().getData(languageTag: 'kk');

      expect(data, isList);
    });
  });

  group('TaharatJsonData(ru)', () {
    test('taharat_ru.json', () async {
      List<TaharatModel> data =
          await TaharatLocalDataRepository().getData(languageTag: 'ru');

      expect(data, isList);
    });
  });
}
