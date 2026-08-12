import 'package:get_it/get_it.dart';
import 'state/app_state.dart';

/// "getIt" es la instancia global del Service Locator (GetIt).
final getIt = GetIt.instance;

/// Registra el AppState una sola vez como Singleton.
/// Cualquier pantalla puede solicitar `getIt<AppState>()` y recibirá la misma instancia.
void setupLocator() {
  if (!getIt.isRegistered<AppState>()) {
    getIt.registerLazySingleton<AppState>(() => AppState());
  }
}