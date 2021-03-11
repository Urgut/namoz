import 'package:namazapp/core/services/json.service.dart';

class AboutNamazLocalData {
  static const String basePath = 'assets/data/json/about';

  Future<String> getData() async {
    String language = 'kk';

    // Read file
    String fileName = '$language.json';
    String fullPath = '$basePath/$fileName';

    String response = await JsonService.readJsonFileAndReturnString(fullPath);

    // Convert string to json
    Map<String, dynamic> jsonData = JsonService.convertStringToJson(response);

    // Convert json to dart code
    String result = jsonData['result'];

    return result;
  }
}
