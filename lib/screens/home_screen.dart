import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import '../state/app_state.dart';

/// [HomeScreen] hereda de [WatchingWidget] para redibujarse automáticamente
/// cada vez que el [AppState] notifique un cambio mediante `notifyListeners()`.
class HomeScreen extends WatchingWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha el estado global con watch_it
    final estado = watchIt<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - GetIt & WatchIt'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Explicativo del Ejercicio del Equipo 8
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      Icons.hub_outlined,
                      size: 40,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Gestión de Estado: GetIt + WatchIt',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Equipo 8: Dany Sebastian | Brayan David | Carlos Mario',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tarjeta de Estado Global Actual
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.analytics_outlined, color: Colors.teal),
                        const SizedBox(width: 8),
                        Text(
                          'Estado Global (Observado con WatchIt)',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.person),
                      title: const Text('Aprendiz Registrado:'),
                      subtitle: Text(
                        estado.nombreAprendiz,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.star),
                      title: const Text('Participaciones:'),
                      subtitle: Text(
                        '${estado.contadorParticipacion}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.school),
                      title: const Text('Módulo Seleccionado:'),
                      subtitle: Text(
                        estado.moduloActual,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'Navegación por el Árbol de Widgets (4 Pantallas):',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            // Botones de Navegación a P1, P2, P3
            FilledButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/p1'),
              icon: const Icon(Icons.edit_note),
              label: const Text('Ir a P1: Modificar Estado Global'),
            ),
            const SizedBox(height: 10),
            FilledButton.tonalIcon(
              onPressed: () => Navigator.pushNamed(
                context,
                '/p2',
                arguments: 'Mensaje directo enviado desde Home usando argumentos de ruta',
              ),
              icon: const Icon(Icons.touch_app),
              label: const Text('Ir a P2: Reactividad y Paso de Datos'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/p3'),
              icon: const Icon(Icons.checklist),
              label: const Text('Ir a P3: Resumen y Control Global'),
            ),
          ],
        ),
      ),
    );
  }
}