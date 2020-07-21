import 'package:flutter/material.dart';
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
    return Container(
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
    return Container(
      child: Text(
        AppLocalizations.of(context).translate(t),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buildEachNamazList(List<String> namazs) {
    List<Widget> result = [];

    for (int i = 0; i < namazs.length; i++) {
      result.add(Text(
        AppLocalizations.of(context).translate(namazs[i]),
        style: TextStyle(color: Colors.white),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: result,
    );
  }
}
