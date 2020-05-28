import 'package:get_it/get_it.dart';
import 'package:namazapp/core/services/navigation.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Services
  locator.registerLazySingleton(() => NavigationService());

  // Bloc

  // Repository

  // Data sources

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
