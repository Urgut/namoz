import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/pages-header.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/service/http.dart';
import 'package:namazapp/router.dart';
import 'locator.dart' as di;

void main() async {
  // Inialize dependecies
  await di.init();

  // Run interceptors
  setupInterceptors();

  // Start app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PagesHeader.home,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.taharatPage,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
