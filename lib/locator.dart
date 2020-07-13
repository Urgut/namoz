import 'package:get_it/get_it.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:namazapp/features/home/data/datasources/menu-local-data.dart';
import 'package:namazapp/features/home/data/datasources/namaz-general-local-data.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => MenuLocalData());
  locator.registerLazySingleton(() => NamazGeneralLocalData());

  // Bloc

  // Repository

  // Data sources

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
