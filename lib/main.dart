import 'package:flutter/material.dart';
import 'locator.dart';
import 'screens/home_screen.dart';
import 'screens/p1_screen.dart';
import 'screens/p2_screen.dart';
import 'screens/p3_screen.dart';

void main() {
  // 1. Inicializamos GetIt (el Service Locator) antes de construir el árbol de widgets
  setupLocator();
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetIt & WatchIt - Equipo 8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003926), // Verde SENA
        ),
      ),
      // Definición de las 4 pantallas (Home /, P1, P2, P3)
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/p1': (context) => const P1Screen(),
        '/p2': (context) {
          // Ejemplo de lectura de argumentos enviados por ruta (Paso de Valores)
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          return P2Screen(
            mensajeDesdeP1: args ?? 'Acceso directo desde menú principal',
          );
        },
        '/p3': (context) => const P3Screen(),
      },
    );
  }
}