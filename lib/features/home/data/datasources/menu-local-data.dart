import 'package:namazapp/features/home/data/models/menu-item.model.dart';
import 'package:namazapp/shared/fonts/namaz_fonts.dart';

class MenuLocalData {
  Future<List<MenuItemModel>> getData() async {
    List<MenuItemModel> result = [];

    result.add(MenuItemModel(
      icon: NamazIcons.taharat,
      title: 'taharat',
      route: '/',
    ));

    result.add(MenuItemModel(
      icon: NamazIcons.settings,
      title: 'language',
      route: '/',
    ));

    result.add(MenuItemModel(
      icon: NamazIcons.faqs,
      title: 'faqs',
      route: '/',
    ));

    return result;
  }
}
