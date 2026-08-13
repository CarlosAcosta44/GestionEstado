import 'package:get_it/get_it.dart';
import 'state/app_state.dart';

/// Instancia global del Service Locator (GetIt).
/// Nos permite acceder a nuestras clases de estado/lógica desde cualquier
/// lugar de la aplicación sin necesitar 'BuildContext'.
final getIt = GetIt.instance;

/// Registra las dependencias y estados globales en GetIt al iniciar la app.
void setupLocator() {
  if (!getIt.isRegistered<AppState>()) {
    // registerLazySingleton crea la instancia la primera vez que se solicita
    getIt.registerLazySingleton<AppState>(() => AppState());
  }
}