import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import '../locator.dart';
import '../state/app_state.dart';

/// [P3Screen] hereda de [WatchingWidget] y actúa como pantalla final de resumen
/// mostrando todos los valores acumulados en el estado global y permitiendo reiniciarlo.
class P3Screen extends WatchingWidget {
  const P3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha el estado global con watch_it
    final estado = watchIt<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('P3 - Resumen & Control Global'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Encabezado de Resumen
            Card(
              color: Colors.green.shade50,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.verified_outlined, color: Colors.green, size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resumen Consolidado',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade900,
                                ),
                          ),
                          const Text(
                            'Información sincronizada en todo el árbol de widgets vía WatchIt',
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tarjeta con los datos del estado
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      leading: const CircleAvatar(child: Icon(Icons.person, size: 18)),
                      title: const Text('Aprendiz:'),
                      subtitle: Text(
                        estado.nombreAprendiz,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      dense: true,
                      leading: const CircleAvatar(child: Icon(Icons.star, size: 18)),
                      title: const Text('Participaciones Totales:'),
                      subtitle: Text(
                        '${estado.contadorParticipacion}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      dense: true,
                      leading: const CircleAvatar(child: Icon(Icons.school, size: 18)),
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

            // Acciones globales
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red.shade700,
                side: BorderSide(color: Colors.red.shade300),
              ),
              onPressed: () {
                getIt<AppState>().reiniciarTodo();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('🔄 Estado global reiniciado a sus valores por defecto'),
                  ),
                );
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reiniciar Todo el Estado Global'),
            ),
            const SizedBox(height: 12),

            FilledButton.icon(
              onPressed: () {
                // Retornar hasta la raíz del árbol de navegación (Home)
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.home_outlined),
              label: const Text('Volver a la Pantalla Principal (Home)'),
            ),
          ],
        ),
      ),
    );
  }
}