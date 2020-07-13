import 'package:flutter/material.dart';
import 'package:namazapp/features/home/data/datasources/namaz-general-local-data.dart';
import 'package:namazapp/features/home/data/models/namaz-general-model.dart';
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
          buildIcon(),
          SizedBox(width: 10),
          Column(
            children: [
              buildTitle(n.title),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIcon() {
    return Container(
      child: Image.asset('assets/images/icons/water-drop.png'),
    );
  }

  Widget buildTitle(String t) {
    return Container(
        child: Text(
      t,
      style: TextStyle(color: Colors.white),
    ));
  }
}
