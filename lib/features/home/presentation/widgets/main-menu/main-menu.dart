import 'package:flutter/material.dart';
import 'package:namazapp/features/home/data/datasources/menu-local-data.dart';
import 'package:namazapp/features/home/data/models/menu-item.model.dart';
import 'package:namazapp/locator.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';

class MainMenu extends StatelessWidget {
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
      // decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildMenuItem(data[0]),
          buildMenuItem(data[1]),
          buildMenuItem(data[2]),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel m) {
    return FlatButton(
      onPressed: () {},
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

  Widget buildIcon(String i) => Container(
        child: Icon(Icons.list, color: Colors.white.withOpacity(0.9)),
      );

  Widget buildTitle(String t) => Container(
          child: Text(
        t,
        style: TextStyle(color: Colors.white),
      ));
}
