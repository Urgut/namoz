import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/features/home/data/models/menu-item.model.dart';
import 'package:namazapp/shared/fonts/namaz_fonts.dart';

class MenuLocalData {
  Future<List<MenuItemModel>> getData() async {
    List<MenuItemModel> result = [];

    result.add(MenuItemModel(
      icon: NamazIcons.taharat,
      title: 'taharat',
      route: Routes.taharatPage,
    ));

    result.add(MenuItemModel(
      icon: NamazIcons.faqs,
      title: 'about_namaz',
      route: Routes.aboutPage,
    ));

    result.add(MenuItemModel(
      icon: NamazIcons.settings,
      title: 'about_project',
      route: "rate",
    ));

    return result;
  }
}
