import 'package:flutter/foundation.dart';

/// Estado global de la aplicación.
/// Extiende [ChangeNotifier] para que [watch_it] escuche cuando llamamos a `notifyListeners()`.
class AppState extends ChangeNotifier {
  String nombre = 'Sin registrar';
  int participaciones = 0;

  void cambiarNombre(String nuevoNombre) {
    if (nuevoNombre.trim().isNotEmpty) {
      nombre = nuevoNombre.trim();
      notifyListeners();
    }
  }

  void sumarParticipacion() {
    participaciones++;
    notifyListeners();
  }

  void restarParticipacion() {
    if (participaciones > 0) {
      participaciones--;
      notifyListeners();
    }
  }

  void reiniciar() {
    nombre = 'Sin registrar';
    participaciones = 0;
    notifyListeners();
  }
}