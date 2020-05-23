import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/pages-header.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/router.dart';
import 'locator.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PagesHeader.home,
      initialRoute: Routes.taharatPage,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
