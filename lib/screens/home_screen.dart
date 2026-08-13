import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import '../state/app_state.dart';

/// [HomeScreen] hereda de [WatchingWidget] para redibujarse cuando cambia [AppState].
class HomeScreen extends WatchingWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos el estado global registrado en GetIt con WatchIt
    final estado = watchIt<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - GetIt & WatchIt'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Equipo 8: GetIt & WatchIt',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Estado Global (WatchIt):',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              'Nombre: ${estado.nombre}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(
              'Participaciones: ${estado.participaciones}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/p1'),
              child: const Text('Ir a Pantalla 1'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/p2',
                arguments: 'Mensaje directo enviado desde Inicio',
              ),
              child: const Text('Ir a Pantalla 2'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/p3'),
              child: const Text('Ir a Pantalla 3'),
            ),
          ],
        ),
      ),
    );
  }
}