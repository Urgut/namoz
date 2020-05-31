import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/model/route.model.dart';
import 'package:namazapp/localization.dart';
import 'package:namazapp/shared/widgets/cover/cover.dart';

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Намаз үйрену')),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          this.buildGender('man'),
          this.buildGender('woman'),
        ],
      ),
    );
  }

  buildGender(String gender) {
    return Expanded(
      flex: 5,
      child: CoverUI(
        title: AppLocalizations.of(context).translate(gender),
        image: 'assets/images/namaz/$gender/namaz.jpg',
        route: RouteModel(
            route: Routes.namazListPage, arguments: {"gender": gender}),
      ),
    );
  }
}
