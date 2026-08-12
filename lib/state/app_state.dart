import 'package:flutter/foundation.dart';

/// Clase que representa el ESTADO GLOBAL de la aplicación.
/// Extiende [ChangeNotifier] para que [watch_it] pueda escuchar sus cambios
/// y notificar a la interfaz de usuario mediante `notifyListeners()`.
class AppState extends ChangeNotifier {
  String _nombreAprendiz = 'Aprendiz sin registrar';
  int _contadorParticipacion = 0;
  String _moduloActual = 'General';

  // Getters para exponer el estado a los widgets
  String get nombreAprendiz => _nombreAprendiz;
  int get contadorParticipacion => _contadorParticipacion;
  String get moduloActual => _moduloActual;

  // Acciones para actualizar el estado
  void actualizarNombre(String nuevoNombre) {
    if (nuevoNombre.trim().isNotEmpty) {
      _nombreAprendiz = nuevoNombre.trim();
      notifyListeners();
    }
  }

  void incrementarParticipacion() {
    _contadorParticipacion++;
    notifyListeners();
  }

  void decrementarParticipacion() {
    if (_contadorParticipacion > 0) {
      _contadorParticipacion--;
      notifyListeners();
    }
  }

  void cambiarModulo(String nuevoModulo) {
    _moduloActual = nuevoModulo;
    notifyListeners();
  }

  void reiniciarTodo() {
    _nombreAprendiz = 'Aprendiz sin registrar';
    _contadorParticipacion = 0;
    _moduloActual = 'General';
    notifyListeners();
  }
}