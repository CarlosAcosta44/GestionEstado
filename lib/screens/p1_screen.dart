import 'package:flutter/material.dart';
import '../locator.dart';
import '../state/app_state.dart';
import 'p2_screen.dart';

/// [P1Screen] permite modificar el estado en GetIt (`getIt<AppState>()`)
/// y demuestra el paso directo de valores de una pantalla a otra mediante constructor.
class P1Screen extends StatefulWidget {
  const P1Screen({super.key});

  @override
  State<P1Screen> createState() => _P1ScreenState();
}

class _P1ScreenState extends State<P1Screen> {
  final TextEditingController _nombreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Leemos el valor actual desde GetIt sin necesidad de context
    _nombreController.text = getIt<AppState>().nombreAprendiz;
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P1 - Registrar Datos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner pedagógico
            Card(
              color: Colors.blue.shade50,
              elevation: 0,
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.blue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '💡 Concepto: Aquí escribimos en GetIt (getIt<AppState>()) sin acoplar la lógica al BuildContext.',
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              '1. Modificar Estado Global:',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del Aprendiz',
                hintText: 'Ej: Dany Sebastian',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {
                final nuevoNombre = _nombreController.text;
                if (nuevoNombre.trim().isEmpty) return;

                // Escribir en el estado global
                getIt<AppState>().actualizarNombre(nuevoNombre);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('✅ Nombre guardado en GetIt (Estado Global)'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('Guardar Nombre en GetIt'),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            Text(
              '2. Paso de Valores Directo (De P1 a P2):',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Envío de datos efímeros por el constructor de P2Screen:',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 14),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade700,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                final mensaje =
                    'Mensaje enviado directamente desde P1 por constructor a las ${TimeOfDay.now().format(context)}';

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => P2Screen(
                      mensajeDesdeP1: mensaje,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.send_outlined),
              label: const Text('Ir a P2 enviando Mensaje Directo'),
            ),
          ],
        ),
      ),
    );
  }
}