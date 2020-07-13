class AppLanguagesService {
  static const kk = 'kk';
  static const ru = 'ru';

  static get defaultLanguage => kk;

  static List<String> getAll() {
    return [kk, ru];
  }

  static bool isLanguageExists(String l) {
    return getAll().contains(l);
  }
}
