import 'package:namazapp/features/home/data/models/menu-item.model.dart';

class MenuLocalData {
  Future<List<MenuItemModel>> getData() async {
    List<MenuItemModel> result = [];

    result.add(MenuItemModel(
      icon: 'water-drop.png',
      title: 'taharat',
      route: '/',
    ));

    result.add(MenuItemModel(
      icon: 'water-drop.png',
      title: 'language',
      route: '/',
    ));

    result.add(MenuItemModel(
      icon: 'water-drop.png',
      title: 'faqs',
      route: '/',
    ));

    return result;
  }
}
