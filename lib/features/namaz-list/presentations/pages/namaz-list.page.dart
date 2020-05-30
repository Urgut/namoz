import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/features/namaz-list/data/datasources/namaz-list-local-datasource.dart';
import 'package:namazapp/features/namaz-list/data/models/namaz-group.model.dart';
import 'package:namazapp/features/namaz-list/data/models/namaz-short.model.dart';
import 'package:namazapp/locator.dart';

class NamazListPage extends StatefulWidget {
  final params;
  NamazListPage(this.params);

  @override
  _NamazListPageState createState() => _NamazListPageState();
}

class _NamazListPageState extends State<NamazListPage> {
  String gender;
  List<NamazGroupModel> namazGroups = NamazListLocalDatasouce().getData();

  // DI
  NavigationService _navService = locator<NavigationService>();

  @override
  void initState() {
    gender = widget.params['gender'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Намаз'),
      ),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: namazGroups.length,
        itemBuilder: (ctx, index) => this.groupBuilder(
          namazGroups[index],
        ),
      ),
    );
  }

  Widget groupBuilder(NamazGroupModel g) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(g.title),
          buildNamazs(g.namazs),
        ],
      ),
    );
  }

  Widget buildNamazs(List<NamazShortModel> namazs) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: namazs.length,
      itemBuilder: (ctx, index) => this.namazItemUI(
        namazs[index],
      ),
    );
  }

  Widget namazItemUI(NamazShortModel n) {
    return GestureDetector(
      onTap: () => _navService.navigateTo(Routes.namazPage, arguments: {
        "gender": this.gender,
        "namazTitle": n.title,
        "namazType": n.type,
        "rakaatDesc": n.rakaatDesc,
      }),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          n.rakaatDesc,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
