import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/locator.dart';

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  // DI
  NavigationService _navService = locator<NavigationService>();

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
          buildGender('Ер'),
          buildGender('Әйел'),
        ],
      ),
    );
  }

  buildGender(String gender) {
    return Expanded(
      flex: 5,
      child: GestureDetector(
        onTap: () => this
            ._navService
            .navigateTo(Routes.namazListPage, arguments: {"gender": gender}),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(width: 0.3)),
          child: Text(
            gender,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
