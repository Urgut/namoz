import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/features/home/data/datasources/namaz-general-local-data.dart';
import 'package:namazapp/features/home/data/models/namaz-general-model.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/locator.dart';
import 'package:namazapp/shared/widgets/empty.dart';
import 'package:namazapp/shared/widgets/error/error.dart';
import 'package:namazapp/shared/widgets/spinner/spinner.dart';

class NamazList extends StatefulWidget {
  @override
  _NamazListState createState() => _NamazListState();
}

class _NamazListState extends State<NamazList> {
  // DI
  NavigationService _navService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator<NamazGeneralLocalData>().getData(),
      builder: (ctx, state) {
        if (state.hasError) {
          return AppError(error: state.error);
        }

        if (state.hasData && state.data.length == 0) {
          return AppEmpty();
        }

        if (state.hasData && state.data.length > 0) {
          return buildContent(state.data);
        }

        return AppSpinner();
      },
    );
  }

  Widget buildContent(List<NamazGeneralModel> data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (ctx, index) {
        return buildItem(data[index]);
      },
    );
  }

  Widget buildItem(NamazGeneralModel n) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () => onGo(n.title),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0XFA0064AA0).withOpacity(0.8),
        ),
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            buildIcon(n.icon),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(n.title),
                SizedBox(height: 10),
                buildEachNamazList(n.namazs),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(IconData i) {
    return Container(
      child: Icon(
        i,
        color: Colors.white,
        size: 45,
      ),
    );
  }

  Widget buildTitle(String t) {
    return Text(
      AppLocalizations.of(context).translate(t),
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  Widget buildEachNamazList(List<String> namazs) {
    List<Widget> result = [];

    for (int i = 0; i < namazs.length; i++) {
      result.add(Text(
        AppLocalizations.of(context).translate(namazs[i]),
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: result,
    );
  }

  onGo(String t) {
    return _navService.navigateTo(Routes.namazPage, arguments: {
      "gender": "man",
      "namazTitle": t,
      "namazType": "sunna",
      "rakaatDesc": "2_rakaats_sunna",
    });
  }
}
