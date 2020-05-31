import 'package:namazapp/core/services/json.service.dart';
import 'package:namazapp/features/about-namaz/models/preview-article.model.dart';

class AboutNamazLocalData {
  static const String basePath = 'assets/data/json/about';

  Future<List<PreviewArticleModel>> getData() async {
    String language = 'kk';

    // Read file
    String fileName = '$language.json';
    String fullPath = '$basePath/$fileName';

    String response = await JsonService.readJsonFileAndReturnString(fullPath);

    // Convert string to json
    Map<String, dynamic> jsonData = JsonService.convertStringToJson(response);

    // Convert json to dart code
    List<PreviewArticleModel> result = [];
    for (dynamic i in jsonData['result']) {
      result.add(PreviewArticleModel.fromJson(i));
    }

    return result;
  }
}
