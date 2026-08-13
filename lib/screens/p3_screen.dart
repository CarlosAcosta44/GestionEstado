import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import '../locator.dart';
import '../state/app_state.dart';

class P3Screen extends WatchingWidget {
  const P3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos el estado global con watchIt
    final estado = watchIt<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Resumen del Estado Global:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Nombre: ${estado.nombre}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Participaciones: ${estado.participaciones}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                getIt<AppState>().reiniciar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Estado reiniciado')),
                );
              },
              child: const Text('Reiniciar Estado Global'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Volver al Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}