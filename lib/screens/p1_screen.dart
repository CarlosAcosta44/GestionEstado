import 'package:flutter/material.dart';
import '../locator.dart';
import '../state/app_state.dart';
import 'p2_screen.dart';

class P1Screen extends StatefulWidget {
  const P1Screen({super.key});

  @override
  State<P1Screen> createState() => _P1ScreenState();
}

class _P1ScreenState extends State<P1Screen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = getIt<AppState>().nombre;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ingresa un nombre o mensaje',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getIt<AppState>().cambiarNombre(_controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Guardado en el estado global (GetIt)')),
                );
              },
              child: const Text('Guardar en Estado Global'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final texto = _controller.text.trim().isEmpty
                    ? 'Mensaje enviado desde la pantalla 1'
                    : _controller.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => P2Screen(mensajeDesdeP1: texto),
                  ),
                );
              },
              child: const Text('Ir a Pantalla 2 (Paso Directo)'),
            ),
          ],
        ),
      ),
    );
  }
}