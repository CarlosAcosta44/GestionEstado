import 'package:flutter/material.dart';
import 'locator.dart';
import 'screens/home_screen.dart';
import 'screens/p1_screen.dart';
import 'screens/p2_screen.dart';
import 'screens/p3_screen.dart';

void main() {
  // Inicializamos las dependencias en GetIt antes de construir el árbol de widgets
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
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/p1': (context) => const P1Screen(),
        '/p2': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          return P2Screen(
            mensajeDesdeP1: args ?? 'Accedido directamente desde el menú principal',
          );
        },
        '/p3': (context) => const P3Screen(),
      },
    );
  }
}