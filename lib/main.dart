import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:namazapp/core/constants/pages-header.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/core/services/http.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/core/store/settings/gender-bloc.dart';
import 'package:namazapp/localization.dart';
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
  // ignore: close_sinks
  final genderBloc = GenderBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => genderBloc),
        ],
        child: MaterialApp(
          title: PagesHeader.home,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homePage,
          onGenerateRoute: AppRouter.generateRoute,
          navigatorKey: di.locator<NavigationService>().navigatorKey,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('kk', 'KZ'),
            const Locale('ru', 'RU'),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            // LocalStorageService _storageService = locator<LocalStorageService>();

            // If user language exist in storage then load it
            // if (_storageService.language != null) {
            //   Locale storedLocale = supportedLocales.firstWhere(
            //       (element) => element.languageCode == _storageService.language);
            //   return storedLocale;
            // }

            // If not exist on storage load language that exist in the list
            // for (var supportedLocale in supportedLocales) {
            //   if (supportedLocale.languageCode == locale.languageCode) {
            //     // _storageService.language = supportedLocale.languageCode;
            //     return supportedLocale;
            //   }
            // }

            // Default is kazakh language
            return supportedLocales.first;
          },
        ));
  }
}
