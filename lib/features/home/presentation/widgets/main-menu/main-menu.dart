import 'package:flutter/material.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/features/home/data/datasources/menu-local-data.dart';
import 'package:namazapp/features/home/data/models/menu-item.model.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/locator.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  NavigationService _navService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator<MenuLocalData>().getData(),
      builder: (cxt, state) {
        if (state.hasError) {
          return AppError(error: state.error);
        }

        if (state.data != null && state.data.length == 0) {
          return AppEmpty();
        }

        if (state.hasData) {
          return buildContent(state.data);
        }

        return AppSpinner();
      },
    );
  }

  Widget buildContent(List<MenuItemModel> data) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildMenuItem(data[0]),
          buildMenuItem(data[1]),
          buildMenuIRate(data[2])
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel m) {
    return TextButton(
      onPressed: () {
        this.onGo(m.route);
      },
      child: Container(
        child: Column(
          children: [
            buildIcon(m.icon),
            SizedBox(height: 3),
            buildTitle(m.title),
          ],
        ),
      ),
    );
  }

  Widget buildMenuIRate(MenuItemModel m) {
    return TextButton(
      onPressed: () {
        return openRate();
      },
      child: Container(
        child: Column(
          children: [
            buildIcon(m.icon),
            SizedBox(height: 3),
            buildTitle(m.title),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(IconData i) => Container(
        child: Icon(
          i,
          color: Colors.white.withOpacity(0.9),
        ),
      );

  Widget buildTitle(String t) => Container(
        child: Text(
          AppLocalizations.of(context).translate(t),
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      );

  onGo(String url) {
    return _navService.navigateTo(url);
  }

  openRate() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.serik.namazapp';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lauch $url';
    }
  }
}
