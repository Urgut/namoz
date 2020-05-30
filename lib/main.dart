import 'package:flutter/material.dart';
import 'package:namazapp/core/constants/pages-header.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/services/http.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/router.dart';
import 'locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      initialRoute: Routes.homePage,
      onGenerateRoute: Router.generateRoute,
      navigatorKey: di.locator<NavigationService>().navigatorKey,
    );
  }
}
