import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/features/home/presentation/pages/home/home.page.dart';
import 'package:namazapp/features/taharat/bloc/taharat-bloc.dart';
import 'package:namazapp/features/taharat/bloc/taharat-events.dart';
import 'package:namazapp/features/taharat/data/datasources/taharat-local-data.dart';
import 'package:namazapp/features/taharat/presentation/pages/taharat-general/taharat-general.page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.taharatPage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (ctx) =>
                      TaharatBloc(repos: new TaharatLocalDataRepository())
                        ..add(TaharatEvents.loadTahartDetails)),
            ],
            child: TaharatGeneralPage(),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
