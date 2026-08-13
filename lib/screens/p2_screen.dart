import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import '../locator.dart';
import '../state/app_state.dart';

class P2Screen extends WatchingWidget {
  final String mensajeDesdeP1;

  const P2Screen({
    super.key,
    required this.mensajeDesdeP1,
  });

  @override
  Widget build(BuildContext context) {
    // Escuchamos el estado global con watchIt
    final estado = watchIt<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Mensaje recibido:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              mensajeDesdeP1,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 35),
            Text(
              'Reactividad (Participaciones: ${estado.participaciones})',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => getIt<AppState>().restarParticipacion(),
                  child: const Text('-1'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => getIt<AppState>().sumarParticipacion(),
                  child: const Text('+1'),
                ),
              ],
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/p3'),
              child: const Text('Ir a Pantalla 3'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Regresar a Pantalla 1'),
            ),
          ],
        ),
      ),
    );
  }
}