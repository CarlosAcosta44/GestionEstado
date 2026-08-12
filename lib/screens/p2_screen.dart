import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import '../locator.dart';
import '../state/app_state.dart';

/// [P2Screen] hereda de [WatchingWidget] para observar cambios en [AppState].
/// Muestra tanto el parámetro recibido por constructor como el estado global reactivo.
class P2Screen extends WatchingWidget {
  final String mensajeDesdeP1;

  const P2Screen({
    super.key,
    required this.mensajeDesdeP1,
  });

  @override
  Widget build(BuildContext context) {
    // Escucha el estado global con WatchIt
    final estado = watchIt<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('P2 - Reactividad & Interacción'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Muestra del valor recibido por constructor (Paso de Valores Directo)
            Card(
              color: Colors.amber.shade50,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.mark_email_read_outlined, color: Colors.amber),
                        SizedBox(width: 8),
                        Text(
                          'Paso de Parámetro (Constructor/Ruta):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mensajeDesdeP1,
                      style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Muestra de Reactividad del Estado Global
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '⚡ Reactividad de la Pantalla (WatchIt)',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Aprendiz: ${estado.nombreAprendiz}',
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${estado.contadorParticipacion}',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const Text('Participaciones'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.filledTonal(
                          onPressed: () => getIt<AppState>().decrementarParticipacion(),
                          icon: const Icon(Icons.remove),
                          tooltip: 'Restar participacion',
                        ),
                        const SizedBox(width: 20),
                        IconButton.filled(
                          onPressed: () => getIt<AppState>().incrementarParticipacion(),
                          icon: const Icon(Icons.add),
                          tooltip: 'Sumar participacion',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Cambio de Módulo (Demostración de mutación de estado con reactividad inmediata)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Módulo Activo (Actualización en Vivo):',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(value: 'Flutter', label: Text('Flutter')),
                          ButtonSegment(value: 'Dart', label: Text('Dart')),
                          ButtonSegment(value: 'GetIt', label: Text('GetIt')),
                        ],
                        selected: {estado.moduloActual},
                        onSelectionChanged: (Set<String> newSelection) {
                          getIt<AppState>().cambiarModulo(newSelection.first);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            FilledButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/p3'),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Ir a P3 (Resumen)'),
            ),
          ],
        ),
      ),
    );
  }
}